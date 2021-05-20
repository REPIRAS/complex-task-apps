﻿using Npgsql;
using System;
using System.Data;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class formManager : Form
    {
        String attribut;
        String connectionString = "database=rentcarsdb;server=localhost;port=5432;uid=postgres;password=pass;";
        public formManager()
        {
            InitializeComponent();
            
            // Для вкладки "Доступные автомобили"
            LoadData("SELECT * FROM car WHERE rented = false", dataGridViewListCarsNotInRent, comboBoxAvailableCarsFirst);
            comboBoxAvailableCarsFirst.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBoxAvailableCarsSecond.DropDownStyle = ComboBoxStyle.DropDownList;
            labelSelectCriterionAvailableCarsSecond.Visible = false;
            comboBoxAvailableCarsSecond.Visible = false;

            // Для вкладки "Автомобили в прокате"
            comboBoxRentedCarsFirst.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBoxRentedCarsSecond.DropDownStyle = ComboBoxStyle.DropDownList;
            labelSelectCriterionRentedCarsSecond.Visible = false;
            comboBoxRentedCarsSecond.Visible = false;

            // Для вкладки "Список автомобилей"
            comboBoxListCarsFirst.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBoxListCarsSecond.DropDownStyle = ComboBoxStyle.DropDownList;
            labelSelectCriterionListCarsSecond.Visible = false;
            comboBoxListCarsSecond.Visible = false;
        }


        // Общие функции

        /// <summary>
        /// Заполнение DataGridView данными
        /// </summary>
        private void DataGridViewAddCells(DataGridView dataGridView, NpgsqlDataReader reader, String[] parameters)
        {
            int rowNum = 0;
            if (dataGridView.RowCount != 0)
                dataGridView.RowCount = 0;
            while (reader.Read())
            {
                dataGridView.RowCount++;
                for (int i = 0; i < parameters.Length; i++)
                {
                    dataGridView.Rows[rowNum].Cells[i].Value = reader[parameters[i]].ToString();
                }
                rowNum++;
            }
        }

        /// <summary>
        /// Заполнение ComboBox данными
        /// </summary>
        private void ComboBoxAddItems(ComboBox combo, String read, NpgsqlDataReader reader)
        {
            while (reader.Read())
            {
                if (!combo.Items.Contains(reader[read].ToString()))
                    combo.Items.Add(reader[read].ToString());
            }
        }

        /// <summary>
        /// Загрузка данных
        /// </summary>
        private void LoadData(String strSQL, DataGridView dataGridView, ComboBox comboBoxFirst)
        {
            using (NpgsqlConnection npgSqlConnection = new NpgsqlConnection(connectionString))
            {
                try
                {
                    npgSqlConnection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand(strSQL, npgSqlConnection);
                    using (NpgsqlDataReader reader = cmd.ExecuteReader())
                    {
                        DataGridViewAddCells(dataGridView, reader, new String[] { "name", "brand", "classcar", "transmission", "color" });
                    }
                    if (comboBoxFirst.Items.Count == 0)
                    {
                        for (int i = 0; i < dataGridView.Columns.Count; i++)
                        {
                            comboBoxFirst.Items.Add(dataGridView.Columns[i].HeaderText);
                        }
                    }
                    npgSqlConnection.Close();
                }
                catch (NpgsqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        // Для вкладки "Доступные автомобили"

        private void comboBoxAvailableCarsFirst_Click(object sender, EventArgs e)
        {
            labelSelectCriterionAvailableCarsSecond.Visible = false;
            comboBoxAvailableCarsSecond.Visible = false;
        }

        private void comboBoxAvailableCarsFirst_SelectedValueChanged(object sender, EventArgs e)
        {
            if (comboBoxAvailableCarsFirst.SelectedItem != null)
            {
                comboBoxAvailableCarsSecond.Items.Clear();
                LoadData("SELECT * FROM car WHERE rented = false", dataGridViewListCarsNotInRent, comboBoxAvailableCarsFirst);
                using (NpgsqlConnection npgSqlConnection = new NpgsqlConnection(connectionString))
                {
                    npgSqlConnection.Open();
                    String strSQL = "SELECT * FROM car WHERE rented = false";
                    NpgsqlCommand cmd = new NpgsqlCommand(strSQL, npgSqlConnection);
                    using (NpgsqlDataReader reader = cmd.ExecuteReader())
                    {
                        attribut = null;
                        if (comboBoxAvailableCarsFirst.SelectedItem.ToString() == "Название")
                        {
                            ComboBoxAddItems(comboBoxAvailableCarsSecond, "name", reader);
                            attribut = "name";
                        }
                        else if (comboBoxAvailableCarsFirst.SelectedItem.ToString() == "Бренд")
                        {
                            ComboBoxAddItems(comboBoxAvailableCarsSecond, "brand", reader);
                            attribut = "brand";
                        }
                        else if (comboBoxAvailableCarsFirst.SelectedItem.ToString() == "Класс")
                        {
                            ComboBoxAddItems(comboBoxAvailableCarsSecond, "classcar", reader);
                            attribut = "classcar";
                        }
                        else if (comboBoxAvailableCarsFirst.SelectedItem.ToString() == "Коробка передач")
                        {
                            ComboBoxAddItems(comboBoxAvailableCarsSecond, "transmission", reader);
                            attribut = "transmission";
                        }
                        else if (comboBoxAvailableCarsFirst.SelectedItem.ToString() == "Цвет")
                        {
                            ComboBoxAddItems(comboBoxAvailableCarsSecond, "color", reader);
                            attribut = "color";
                        }
                    }
                    npgSqlConnection.Close();
                }
                labelSelectCriterionAvailableCarsSecond.Visible = true;
                comboBoxAvailableCarsSecond.Visible = true;
            }
        }

        private void comboBoxAvailableCarsSecond_SelectedValueChanged(object sender, EventArgs e)
        {
            using (NpgsqlConnection npgSqlConnection = new NpgsqlConnection(connectionString))
            {
                npgSqlConnection.Open();
                String strSQL = "SELECT * FROM car WHERE " + attribut + " LIKE '" + comboBoxAvailableCarsSecond.SelectedItem.ToString() + "' AND rented = false";
                NpgsqlCommand cmd = new NpgsqlCommand(strSQL, npgSqlConnection);
                using (NpgsqlDataReader reader = cmd.ExecuteReader())
                {
                    DataGridViewAddCells(dataGridViewListCarsNotInRent, reader, new String[] { "name", "brand", "classcar", "transmission", "color" });
                }
                npgSqlConnection.Close();
            }
        }

        private void buttonUpdateListNotInRent_Click(object sender, EventArgs e)
        {
            LoadData("SELECT * FROM car WHERE rented = false", dataGridViewListCars, comboBoxListCarsFirst);
        }


        // Для вкладки "Автомобили в прокате"

        private void tabPageCarsInRent_Enter(object sender, EventArgs e)
        {
            LoadData("SELECT * FROM car  WHERE rented = true AND deleted = false", dataGridViewListCarsInRent, comboBoxRentedCarsFirst);
        }

        private void tabPageCarsInRent_Leave(object sender, EventArgs e)
        {
            dataGridViewListCarsInRent.Rows.Clear();
            comboBoxRentedCarsFirst.SelectedItem = null;
            labelSelectCriterionRentedCarsSecond.Visible = false;
            comboBoxRentedCarsSecond.Visible = false;
            comboBoxRentedCarsSecond.Items.Clear();
        }

        private void comboBoxRentedCarsFirst_Click(object sender, EventArgs e)
        {
            labelSelectCriterionRentedCarsSecond.Visible = false;
            comboBoxRentedCarsSecond.Visible = false;
        }

        private void comboBoxRentedCarsFirst_SelectedValueChanged(object sender, EventArgs e)
        {
            if (comboBoxRentedCarsFirst.SelectedItem != null)
            {
                comboBoxRentedCarsSecond.Items.Clear();
                LoadData("SELECT * FROM car WHERE rented = true AND deleted = false", dataGridViewListCarsInRent, comboBoxRentedCarsFirst);
                using (NpgsqlConnection npgSqlConnection = new NpgsqlConnection(connectionString))
                {
                    npgSqlConnection.Open();
                    String strSQL = "SELECT * FROM car WHERE rented = true AND deleted = false";
                    NpgsqlCommand cmd = new NpgsqlCommand(strSQL, npgSqlConnection);
                    using (NpgsqlDataReader reader = cmd.ExecuteReader())
                    {
                        attribut = null;
                        if (comboBoxRentedCarsFirst.SelectedItem.ToString() == "Название")
                        {
                            ComboBoxAddItems(comboBoxRentedCarsSecond, "name", reader);
                            attribut = "name";
                        }
                        else if (comboBoxRentedCarsFirst.SelectedItem.ToString() == "Бренд")
                        {
                            ComboBoxAddItems(comboBoxRentedCarsSecond, "brand", reader);
                            attribut = "brand";
                        }
                        else if (comboBoxRentedCarsFirst.SelectedItem.ToString() == "Класс")
                        {
                            ComboBoxAddItems(comboBoxRentedCarsSecond, "classcar", reader);
                            attribut = "classcar";
                        }
                        else if (comboBoxRentedCarsFirst.SelectedItem.ToString() == "Коробка передач")
                        {
                            ComboBoxAddItems(comboBoxRentedCarsSecond, "transmission", reader);
                            attribut = "transmission";
                        }
                        else if (comboBoxRentedCarsFirst.SelectedItem.ToString() == "Цвет")
                        {
                            ComboBoxAddItems(comboBoxRentedCarsSecond, "color", reader);
                            attribut = "color";
                        }
                    }
                    npgSqlConnection.Close();
                }
                labelSelectCriterionRentedCarsSecond.Visible = true;
                comboBoxRentedCarsSecond.Visible = true;
            }
        }

        private void comboBoxRentedCarsSecond_SelectedValueChanged(object sender, EventArgs e)
        {
            using (NpgsqlConnection npgSqlConnection = new NpgsqlConnection(connectionString))
            {
                npgSqlConnection.Open();
                String strSQL = "SELECT * FROM car WHERE " + attribut + " LIKE '" + comboBoxRentedCarsSecond.SelectedItem.ToString() + "' AND rented = true AND deleted = false";
                NpgsqlCommand cmd = new NpgsqlCommand(strSQL, npgSqlConnection);
                using (NpgsqlDataReader reader = cmd.ExecuteReader())
                {
                    DataGridViewAddCells(dataGridViewListCarsInRent, reader, new String[] { "name", "brand", "classcar", "transmission", "color" });
                }
                npgSqlConnection.Close();
            }
        }

        private void buttonUpdateListCarsInRent_Click(object sender, EventArgs e)
        {
            LoadData("SELECT * FROM car WHERE rented = true AND deleted = false", dataGridViewListCarsInRent, comboBoxRentedCarsFirst);
        }


        // Для вкладки "Список автомобилей"

        private void tabPageListCars_Enter(object sender, EventArgs e)
        {
            LoadData("SELECT * FROM car", dataGridViewListCars, comboBoxListCarsFirst);
        }

        private void tabPageListCars_Leave(object sender, EventArgs e)
        {
            dataGridViewListCars.Rows.Clear();
            comboBoxListCarsFirst.SelectedItem = null;
            labelSelectCriterionListCarsSecond.Visible = false;
            comboBoxListCarsSecond.Visible = false;
            comboBoxListCarsSecond.Items.Clear();
        }

        private void comboBoxListCarsFirst_Click(object sender, EventArgs e)
        {
            labelSelectCriterionListCarsSecond.Visible = false;
            comboBoxListCarsSecond.Visible = false;
        }

        private void comboBoxListCarsFirst_SelectedValueChanged(object sender, EventArgs e)
        {
            if (comboBoxListCarsFirst.SelectedItem != null)
            {
                comboBoxListCarsSecond.Items.Clear();
                LoadData("SELECT * FROM car", dataGridViewListCars, comboBoxListCarsFirst);
                using (NpgsqlConnection npgSqlConnection = new NpgsqlConnection(connectionString))
                {
                    npgSqlConnection.Open();
                    String strSQL = "SELECT * FROM car";
                    NpgsqlCommand cmd = new NpgsqlCommand(strSQL, npgSqlConnection);
                    using (NpgsqlDataReader reader = cmd.ExecuteReader())
                    {
                        attribut = null;
                        if (comboBoxListCarsFirst.SelectedItem.ToString() == "Название")
                        {
                            ComboBoxAddItems(comboBoxListCarsSecond, "name", reader);
                            attribut = "name";
                        }
                        else if (comboBoxListCarsFirst.SelectedItem.ToString() == "Бренд")
                        {
                            ComboBoxAddItems(comboBoxListCarsSecond, "brand", reader);
                            attribut = "brand";
                        }
                        else if (comboBoxListCarsFirst.SelectedItem.ToString() == "Класс")
                        {
                            ComboBoxAddItems(comboBoxListCarsSecond, "classcar", reader);
                            attribut = "classcar";
                        }
                        else if (comboBoxListCarsFirst.SelectedItem.ToString() == "Коробка передач")
                        {
                            ComboBoxAddItems(comboBoxListCarsSecond, "transmission", reader);
                            attribut = "transmission";
                        }
                        else if (comboBoxListCarsFirst.SelectedItem.ToString() == "Цвет")
                        {
                            ComboBoxAddItems(comboBoxListCarsSecond, "color", reader);
                            attribut = "color";
                        }
                    }
                    npgSqlConnection.Close();
                }
                labelSelectCriterionListCarsSecond.Visible = true;
                comboBoxListCarsSecond.Visible = true;
            }
        }
        private void comboBoxListCarsSecond_SelectedValueChanged(object sender, EventArgs e)
        {
            using (NpgsqlConnection npgSqlConnection = new NpgsqlConnection(connectionString))
            {
                npgSqlConnection.Open();
                String strSQL = "SELECT * FROM car WHERE " + attribut + " LIKE '" + comboBoxListCarsSecond.SelectedItem.ToString() + "'";
                NpgsqlCommand cmd = new NpgsqlCommand(strSQL, npgSqlConnection);
                using (NpgsqlDataReader reader = cmd.ExecuteReader())
                {
                    DataGridViewAddCells(dataGridViewListCars, reader, new String[] { "name", "brand", "classcar", "transmission", "color" });
                }
                npgSqlConnection.Close();
            }
        }

        private void buttonListCarsUpdate_Click(object sender, EventArgs e)
        {
            LoadData("SELECT * FROM car", dataGridViewListCars, comboBoxListCarsFirst);
        }

        // Для вкладки справочник

        private void buttonAddBonus_Click(object sender, EventArgs e)
        {
            using (NpgsqlConnection npgSqlConnection = new NpgsqlConnection(connectionString))
            {
                try
                {
                    npgSqlConnection.Open();
                    String strSQL = "INSERT INTO bonussystem (description, discountpercent) VALUES ('" + textBoxDescription.Text + "', '" + textBoxCoef.Text + "')";
                    NpgsqlCommand cmd = new NpgsqlCommand(strSQL, npgSqlConnection);
                    if (cmd.ExecuteNonQuery() == 1)
                        MessageBox.Show("Запись успешно добавлена!");
                    strSQL = "SELECT * FROM bonussystem";
                    cmd = new NpgsqlCommand(strSQL, npgSqlConnection);
                    NpgsqlDataReader rdr = cmd.ExecuteReader();
                    DataTable t = new DataTable();
                    t.Load(rdr);
                    dataGridView4.DataSource = t.DefaultView;
                    npgSqlConnection.Close();
                }
                catch (NpgsqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        
    }
}

﻿
namespace WindowsFormsApp1
{
    partial class formEditRentCar
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(formEditRentCar));
            this.buttonCancel = new System.Windows.Forms.Button();
            this.buttonUpdate = new System.Windows.Forms.Button();
            this.textBoxCost = new System.Windows.Forms.TextBox();
            this.labelCountDaysRent = new System.Windows.Forms.Label();
            this.labelDateOfIssue = new System.Windows.Forms.Label();
            this.labelCost = new System.Windows.Forms.Label();
            this.dateTimePickerDateOfIssue = new System.Windows.Forms.DateTimePicker();
            this.numericUpDownCountDaysRent = new System.Windows.Forms.NumericUpDown();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDownCountDaysRent)).BeginInit();
            this.SuspendLayout();
            // 
            // buttonCancel
            // 
            this.buttonCancel.Location = new System.Drawing.Point(353, 129);
            this.buttonCancel.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.buttonCancel.Name = "buttonCancel";
            this.buttonCancel.Size = new System.Drawing.Size(121, 33);
            this.buttonCancel.TabIndex = 73;
            this.buttonCancel.Text = "Отмена";
            this.buttonCancel.UseVisualStyleBackColor = true;
            this.buttonCancel.Click += new System.EventHandler(this.buttonCancel_Click);
            // 
            // buttonUpdate
            // 
            this.buttonUpdate.Location = new System.Drawing.Point(204, 129);
            this.buttonUpdate.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.buttonUpdate.Name = "buttonUpdate";
            this.buttonUpdate.Size = new System.Drawing.Size(121, 33);
            this.buttonUpdate.TabIndex = 72;
            this.buttonUpdate.Text = "Обновить";
            this.buttonUpdate.UseVisualStyleBackColor = true;
            this.buttonUpdate.Click += new System.EventHandler(this.buttonUpdate_Click);
            // 
            // textBoxCost
            // 
            this.textBoxCost.Location = new System.Drawing.Point(203, 14);
            this.textBoxCost.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.textBoxCost.Multiline = true;
            this.textBoxCost.Name = "textBoxCost";
            this.textBoxCost.Size = new System.Drawing.Size(271, 29);
            this.textBoxCost.TabIndex = 69;
            // 
            // labelCountDaysRent
            // 
            this.labelCountDaysRent.AutoSize = true;
            this.labelCountDaysRent.Location = new System.Drawing.Point(13, 86);
            this.labelCountDaysRent.Name = "labelCountDaysRent";
            this.labelCountDaysRent.Size = new System.Drawing.Size(180, 17);
            this.labelCountDaysRent.TabIndex = 68;
            this.labelCountDaysRent.Text = "Колеиество дней аренды:";
            // 
            // labelDateOfIssue
            // 
            this.labelDateOfIssue.AutoSize = true;
            this.labelDateOfIssue.Location = new System.Drawing.Point(9, 52);
            this.labelDateOfIssue.Name = "labelDateOfIssue";
            this.labelDateOfIssue.Size = new System.Drawing.Size(183, 17);
            this.labelDateOfIssue.TabIndex = 67;
            this.labelDateOfIssue.Text = "Дата аренды автомобиля:";
            // 
            // labelCost
            // 
            this.labelCost.AutoSize = true;
            this.labelCost.Location = new System.Drawing.Point(59, 17);
            this.labelCost.Name = "labelCost";
            this.labelCost.Size = new System.Drawing.Size(131, 17);
            this.labelCost.TabIndex = 66;
            this.labelCost.Text = "Стоимость заказа:";
            // 
            // dateTimePickerDateOfIssue
            // 
            this.dateTimePickerDateOfIssue.Location = new System.Drawing.Point(203, 49);
            this.dateTimePickerDateOfIssue.Margin = new System.Windows.Forms.Padding(4);
            this.dateTimePickerDateOfIssue.Name = "dateTimePickerDateOfIssue";
            this.dateTimePickerDateOfIssue.Size = new System.Drawing.Size(271, 22);
            this.dateTimePickerDateOfIssue.TabIndex = 74;
            // 
            // numericUpDownCountDaysRent
            // 
            this.numericUpDownCountDaysRent.Location = new System.Drawing.Point(204, 81);
            this.numericUpDownCountDaysRent.Margin = new System.Windows.Forms.Padding(4);
            this.numericUpDownCountDaysRent.Maximum = new decimal(new int[] {
            999,
            0,
            0,
            0});
            this.numericUpDownCountDaysRent.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.numericUpDownCountDaysRent.Name = "numericUpDownCountDaysRent";
            this.numericUpDownCountDaysRent.Size = new System.Drawing.Size(271, 22);
            this.numericUpDownCountDaysRent.TabIndex = 75;
            this.numericUpDownCountDaysRent.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // formEditRentCar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(495, 169);
            this.Controls.Add(this.numericUpDownCountDaysRent);
            this.Controls.Add(this.dateTimePickerDateOfIssue);
            this.Controls.Add(this.buttonCancel);
            this.Controls.Add(this.buttonUpdate);
            this.Controls.Add(this.textBoxCost);
            this.Controls.Add(this.labelCountDaysRent);
            this.Controls.Add(this.labelDateOfIssue);
            this.Controls.Add(this.labelCost);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "formEditRentCar";
            this.Text = "Изменение данных аренды";
            this.Load += new System.EventHandler(this.formEditRentCar_Load);
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDownCountDaysRent)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button buttonCancel;
        private System.Windows.Forms.Button buttonUpdate;
        private System.Windows.Forms.TextBox textBoxCost;
        private System.Windows.Forms.Label labelCountDaysRent;
        private System.Windows.Forms.Label labelDateOfIssue;
        private System.Windows.Forms.Label labelCost;
        private System.Windows.Forms.DateTimePicker dateTimePickerDateOfIssue;
        private System.Windows.Forms.NumericUpDown numericUpDownCountDaysRent;
    }
}
// <auto-generated/>
#pragma warning disable 1591
#pragma warning disable 0414
#pragma warning disable 0649
#pragma warning disable 0169

namespace RentCarsProject.Pages
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Components;
#nullable restore
#line 1 "E:\Документы, файлы\ВятГУ. 4 семестр\Комплексное задание\complex-task-apps\Web\RentCarsProject\_Imports.razor"
using System.Net.Http;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "E:\Документы, файлы\ВятГУ. 4 семестр\Комплексное задание\complex-task-apps\Web\RentCarsProject\_Imports.razor"
using Microsoft.AspNetCore.Authorization;

#line default
#line hidden
#nullable disable
#nullable restore
#line 3 "E:\Документы, файлы\ВятГУ. 4 семестр\Комплексное задание\complex-task-apps\Web\RentCarsProject\_Imports.razor"
using Microsoft.AspNetCore.Components.Authorization;

#line default
#line hidden
#nullable disable
#nullable restore
#line 4 "E:\Документы, файлы\ВятГУ. 4 семестр\Комплексное задание\complex-task-apps\Web\RentCarsProject\_Imports.razor"
using Microsoft.AspNetCore.Components.Forms;

#line default
#line hidden
#nullable disable
#nullable restore
#line 5 "E:\Документы, файлы\ВятГУ. 4 семестр\Комплексное задание\complex-task-apps\Web\RentCarsProject\_Imports.razor"
using Microsoft.AspNetCore.Components.Routing;

#line default
#line hidden
#nullable disable
#nullable restore
#line 6 "E:\Документы, файлы\ВятГУ. 4 семестр\Комплексное задание\complex-task-apps\Web\RentCarsProject\_Imports.razor"
using Microsoft.AspNetCore.Components.Web;

#line default
#line hidden
#nullable disable
#nullable restore
#line 7 "E:\Документы, файлы\ВятГУ. 4 семестр\Комплексное задание\complex-task-apps\Web\RentCarsProject\_Imports.razor"
using Microsoft.AspNetCore.Components.Web.Virtualization;

#line default
#line hidden
#nullable disable
#nullable restore
#line 8 "E:\Документы, файлы\ВятГУ. 4 семестр\Комплексное задание\complex-task-apps\Web\RentCarsProject\_Imports.razor"
using Microsoft.JSInterop;

#line default
#line hidden
#nullable disable
#nullable restore
#line 9 "E:\Документы, файлы\ВятГУ. 4 семестр\Комплексное задание\complex-task-apps\Web\RentCarsProject\_Imports.razor"
using RentCarsProject;

#line default
#line hidden
#nullable disable
#nullable restore
#line 10 "E:\Документы, файлы\ВятГУ. 4 семестр\Комплексное задание\complex-task-apps\Web\RentCarsProject\_Imports.razor"
using RentCarsProject.Shared;

#line default
#line hidden
#nullable disable
#nullable restore
#line 11 "E:\Документы, файлы\ВятГУ. 4 семестр\Комплексное задание\complex-task-apps\Web\RentCarsProject\_Imports.razor"
using RentCarsProject.Models;

#line default
#line hidden
#nullable disable
#nullable restore
#line 12 "E:\Документы, файлы\ВятГУ. 4 семестр\Комплексное задание\complex-task-apps\Web\RentCarsProject\_Imports.razor"
using MudBlazor;

#line default
#line hidden
#nullable disable
#nullable restore
#line 3 "E:\Документы, файлы\ВятГУ. 4 семестр\Комплексное задание\complex-task-apps\Web\RentCarsProject\Pages\FetchData.razor"
using RentCarsProject.Data;

#line default
#line hidden
#nullable disable
    [Microsoft.AspNetCore.Components.RouteAttribute("/fetchdata")]
    public partial class FetchData : Microsoft.AspNetCore.Components.ComponentBase
    {
        #pragma warning disable 1998
        protected override void BuildRenderTree(Microsoft.AspNetCore.Components.Rendering.RenderTreeBuilder __builder)
        {
        }
        #pragma warning restore 1998
#nullable restore
#line 39 "E:\Документы, файлы\ВятГУ. 4 семестр\Комплексное задание\complex-task-apps\Web\RentCarsProject\Pages\FetchData.razor"
       
    private WeatherForecast[] forecasts;

    protected override async Task OnInitializedAsync()
    {
        forecasts = await ForecastService.GetForecastAsync(DateTime.Now);
    }

#line default
#line hidden
#nullable disable
        [global::Microsoft.AspNetCore.Components.InjectAttribute] private WeatherForecastService ForecastService { get; set; }
    }
}
#pragma warning restore 1591

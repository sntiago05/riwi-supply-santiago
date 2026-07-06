import {getReport} from "./api.js";
import {renderTable} from "./table.js";

const reports=[

    {
        value:"stock",
        label:"Stock por producto"
    },

    {
        value:"topProduct",
        label:"Producto más comprado"
    },

    {
        value:"topSupplier",
        label:"Proveedor con más compras"
    },

    {
        value:"categorySalesgt10k",
        label:"Categorías promedio > 10.000"
    },

    {
        value:"productWithoutMovement",
        label:"Productos sin movimientos"
    },

    {
        value:"inventoryValueByWarehouse",
        label:"Valor inventario por bodega"
    },

    {
        value:"buysByCity",
        label:"Compras por ciudad"
    },

    {
        value:"top5ProductsExpensive",
        label:"Top productos costosos"
    },

    {
        value:"lowStock",
        label:"Inventario bajo"
    }

];

const select=document.querySelector("#report");
 let htmlSelect =""
reports.forEach(report=>{

   
    htmlSelect+=`

        <option value="${report.value}">

            ${report.label}

        </option>

    `;

});
 select.innerHTML= `<select id="report" class="border rounded p-2 flex-1">
    <option value="" disabled selected>Selecciona un reporte...</option>
</select>`+htmlSelect;

document
    .querySelector("#search")
    .addEventListener("click",async()=>{

        try{

            const data=await getReport(select.value);

            renderTable(data);

        }catch(error){

            alert(error.message);

        }

    });
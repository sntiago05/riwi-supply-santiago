const URL = "http://localhost:3000/reports";

export async function getReport(name){

    const response = await fetch(`${URL}/${name}`);

    if(!response.ok){

        throw new Error("Error consultando el reporte");

    }

    return await response.json();

}
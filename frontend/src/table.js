export function renderTable(data) {
    const container = document.querySelector("#table");
    container.innerHTML = "";

    if (data.length === 0) {
        container.innerHTML = `
            <div class="bg-white rounded-lg shadow p-8 text-center">
                <p class="text-gray-500">Sin resultados</p>
            </div>
        `;
        return;
    }

    const columns = Object.keys(data[0]);

    let html = `
        <div class="bg-white rounded-lg shadow overflow-x-auto">
            <table class="min-w-full text-sm sm:text-base">
                <thead>
                    <tr class="bg-blue-600 text-white sticky top-0">
    `;

    columns.forEach(column => {
        html += `<th class="p-3 text-left whitespace-nowrap">${column}</th>`;
    });

    html += `
                    </tr>
                </thead>
                <tbody>
    `;

    data.forEach((row, i) => {
        const rowBg = i % 2 === 0 ? "bg-white" : "bg-gray-50";
        html += `<tr class="border-b ${rowBg} hover:bg-blue-50 transition-colors">`;

        columns.forEach(column => {
            html += `<td class="p-3 whitespace-nowrap">${row[column]}</td>`;
        });

        html += "</tr>";
    });

    html += `
                </tbody>
            </table>
        </div>
    `;

    container.innerHTML = `
    <p class="text-sm text-gray-500 mb-2">${data.length} resultado${data.length !== 1 ? 's' : ''}</p>
` + html;
}
%dw 2.0
fun generateTableHeaders(data) =
  if ( !isEmpty(data) and data[0] is Object ) data[0] pluck $$ map ((key) -> "<th class='table-header'>$(upper(key replace "_" with " "))</th>") joinBy ""
  else
    ""
fun renderCellValue(cellValue) =
  cellValue match {
	case is Array -> "<td class='cell'><ul class='nested-list'>" ++ (cellValue map "<li>$</li>" joinBy "") ++ "</ul></td>"
    case is Object -> "<td class='cell'><ul class='nested-list object-list'>" ++ (cellValue pluck ((value, key) -> "<li><strong>$(key):</strong> $(value)</li>") joinBy "") ++ "</ul></td>"
    case is Number -> "<td class='cell cell-number'>$(cellValue default "")</td>"
    else -> "<td class='cell'>$(cellValue default "")</td>"
}
fun generateTableRows(data) =
  if ( !isEmpty(data) and data[0] is Object ) data map ((rowObject) -> "<tr class='table-row'>" ++ ((rowObject pluck $) map renderCellValue($) joinBy "") ++ "</tr>") joinBy "\n"
  else
    "<tr><td class='cell cell-no-data' colspan='" ++ (sizeOf(data[0] pluck $$) default 1) ++ "'>No data available</td></tr>"
fun printTable(tableData) = do {
	var tableHeaders = generateTableHeaders(tableData)
	var tableRows = generateTableRows(tableData)
	---
	'
    <table class="dynamic-table">
        <thead><tr>$tableHeaders</tr></thead>
        <tbody>$tableRows</tbody>
    </table>
    '
}
fun printTitle(content) =
  "<h1 class='dynamic-title'>$(content)</h1>"
fun printText(content) =
  "<p class='dynamic-text'>$(content)</p>"
fun renderSingleButton(button) =
  `
    <td class="button-cell">
        <a href="$(button.url default '#')" target="_blank" class="dynamic-button dynamic-button-$(button.style default 'primary')">$(button.text default 'Click Here')</a>
    </td>
  `
fun printButton(content) = do {
	var buttons = if ( content is Array ) content
  else
    [content]
	var buttonsHtml = (buttons map renderSingleButton($)) joinBy ""
	---
	`
    <table class="dynamic-button-container" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        $buttonsHtml
                    </tr>
                </table>
            </td>
        </tr>
    </table>
  `
}
fun parseBody(components) = 
  ((components default []) map (component) -> component.'type' match {
	case "title" -> printTitle(component.content)
      case "text" -> printText(component.content)
      case "table" -> printTable(component.content)
      case "buttonGroup" -> printButton(component.content)
      else -> ""
}) joinBy ""

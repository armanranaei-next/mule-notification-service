%dw 2.0
import * from dw::util::Values


var style = "<style>.logo{width:30px; height:100%; margin-right:2em;}.half{-moz-transform:scale(0.5);-webkit-transform:scale(0.5);transform:scale(0.5);}body{padding:0%1%1%1%;}.content{width:90%;padding-left:5%;padding-left:5%;}.row{display:flex;justify-content:left;margin-top:1rem;margin-bottom:1rem;}#notification-info{font-size:0.8rem;font-family:Arial,Helvetica,sans-serif;border-collapse:collapse;width:100%;padding-right:5%;}#notification-info th{border:0 solid #ddd;padding:12px.5rem;text-align:left;background-color:#004b61;color:#fff;word-break:normal;}#notification-info td{border:1px solid #B4B4B4;padding:.5rem;word-break:break-all;}#notification-info tr:nth-child(2n){background-color:#f0efef}#notification-info.field-name{text-align:center;}.text{font-family:Monaco;}</style>"
var logoSrc = "https://www.florencenext.com/wp-content/uploads/2020/05/logo-copia-3-e1589807452213.png"
fun startTemplate() = '<html>
							  <head>
							    $(style)
							  </head>
							  <body>
							    <div class="row" style="align-items: center !important">
							      <img class="logo half" src="$(logoSrc)" />
							      <p class="text" style="line-height: 3rem">Mule Notification Service</p>
							    </div>
							    <h5 class="text" style="text-align: left">You received a new notification</h5>
							    <br />
							    <div class="content"></div>
						'
fun endTemplate() = "</div></body></html>"

fun writeObjectAsHtml(object) = (write(object,"application/json",{indent: true}) ) replace  /\n(\s*)/ with ("<br/>" ++ (($[1] default "") replace " " with "&nbsp;"))
fun stringifyValue(value) = value match{
	case is Object -> writeObjectAsHtml(value)
	case is Array -> writeObjectAsHtml(value)
	else -> ((value default "not-found" )as String)
}

fun printTable(title,report) = ('<table class="notification-info" cellspacing="2" cellpadding="2" id="notification-info">
                            <tr><th colspan="2">$(title)</th></tr>' ++
                            ((report pluck ((value, key) -> '<tr><td style"text-align:center;">$(key as String)</td><td>$(stringifyValue(value))</td></tr>') joinBy  ""))
                            ++ "</table>") replace  "\n" with ""
                            
fun printArrayAsTable(records) = do {
                        var tableStartTag = '<table class="notification-info" cellspacing="2" cellpadding="2" id="notification-info">'
                        var tableEndTag = '</table>'
                        var headers = namesOf(records[0])
                        fun buildValueTag(record) =
                            '<tr>' ++ ((record pluck(value) -> '<td style"text-align:center;">$(stringifyValue(value))</td>') joinBy " ") ++ '</tr>'
                        ---
                        tableStartTag ++
                        "<tr>" ++ ((headers map '<th>$($)</th>') joinBy " ") ++"</tr>" ++
                        (records map (buildValueTag($)) joinBy ""     )
                        ++ tableEndTag
}
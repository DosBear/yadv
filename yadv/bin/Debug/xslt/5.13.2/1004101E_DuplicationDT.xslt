<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:dupDT="urn:customs.ru:Information:ExchangeDocuments:DuplicationDT:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="/">
      <html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div.page {
									width: 190mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm 10mm 10mm 20mm;
									background: #ffffff;
									border: solid 1pt #000000;
									}

									.marg-top
									{
									margin-top:5mm;
									}

									table
									{
									width: 100%;
									border: 0;
									empty-cells: show;
									border-collapse: collapse;
									margin-top: 1px;
									}

									table.border tr td
									{
									border: 1px solid gray;
									}

									.graph {
									font-family: Arial;
									font-size: 10pt;
									}

									.value
									{
									border-bottom: solid 1px black;
									}

									div.title, tr.title td { font-weight:bold;  }
									.bordered { border-collapse: collapse; }
									td.bordered
									{
									border: solid 1px windowtext;
									}

									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}
								</style>
			</head>

			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<span style="font-size:large; font-weight:bold; ">Уведомление</span>
										<br/>
										<span style="font-size:medium; font-weight:bold; "> о выявлении ДТ, содержащей дублирующие сведения</span>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:46%">Идентификатор процедуры, в которой планируется регистрация ДТ:</td>
							<td class="nnot graphMain" style="width:2%" align="center"></td>
							<td class="value graphMain" style="width:52%">
								<xsl:value-of select="dupDT:DuplicationDT/dupDT:ProcedureID"/>
							</td>
						</tr>
					</table>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:46%">Регистрационный номер ДТ, зарегистрированной ранее в ТО:</td>
							<td class="nnot graphMain" style="width:2%" align="center"></td>
							<td class="value graphMain" style="width:52%">
								<xsl:variable name="CustomsCode">
									<xsl:value-of select="dupDT:DuplicationDT/dupDT:DTRegNumber/cat_ru:CustomsCode"/>
								</xsl:variable>
								<xsl:variable name="RegistrationDate">
									<xsl:value-of select="substring(dupDT:DuplicationDT/dupDT:DTRegNumber/cat_ru:RegistrationDate,9,2)"/>
									<xsl:value-of select="substring(dupDT:DuplicationDT/dupDT:DTRegNumber/cat_ru:RegistrationDate,6,2)"/>
									<xsl:value-of select="substring(dupDT:DuplicationDT/dupDT:DTRegNumber/cat_ru:RegistrationDate,3,2)"/>
								</xsl:variable>
								<xsl:variable name="GTDNumber">
									<xsl:value-of select="dupDT:DuplicationDT/dupDT:DTRegNumber/cat_ru:GTDNumber"/>
								</xsl:variable>
								<xsl:value-of select="concat($CustomsCode,'/',$RegistrationDate,'/',$GTDNumber)"/>
							</td>
						</tr>
					</table>
					<br/>
					<br/>
					<br/>
					<table class="w190">
						<tr>
							<td class="value graphMain" style="width:75%" align="center">
								<xsl:value-of select="dupDT:DuplicationDT/dupDT:CustomsPerson/cat_ru:PersonName"/>
							</td>
							<td class="nnot graphMain" style="width:10%"></td>
							<td class="value graphMain" style="width:15%" align="center">
								<xsl:value-of select="dupDT:DuplicationDT/dupDT:CustomsPerson/cat_ru:LNP"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:75%" align="center">Уполномоченное должностное лицо таможенного органа</td>
							<td class="nnot graphMain" style="width:10%"></td>
							<td class="annot graphMain" style="width:15%" align="center">ЛНП</td>
						</tr>
					</table>
					<br/>
					<br/>
				</div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>

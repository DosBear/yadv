<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:prg="urn:customs.ru:Information:CustomsDocuments:PermitRecallGTD:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="/">
      <html>
         <head>
			 <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					@media print {
						div.page {
							border: none;
							margin:0;
							padding:0;
						}
					}

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

					.marg-top {
						margin-top:5mm;
					}

					table {
						width: 100%;
						border: 0;
						empty-cells: show;
						border-collapse: collapse;
						margin-top: 1px;
					}

					table.border tr {
						border: 1px solid gray;
						padding: 5px;
					}

					table.border td {
						padding: 5px;
						border: solid 1px windowtext;
					}

					.graph {
						font-family: Arial;
						font-size: 10pt;
					}

					.value {
						border-bottom: solid 1px black;
					}

					div.title, tr.title td { font-weight:bold;  }

					.bordered { border-collapse: collapse; }

					td.bordered {
						border: solid 1px windowtext;
					}

					td.graphMain {
						vertical-align:top;
					}

					td.value.graphMain {
						vertical-align:bottom;
					}

          </style>
         </head>
         <body>
           <div class="page">
				<table border="1" border-collapse="separate" class="w190" style="width:25%">
					<td align="center">
						<xsl:for-each select="prg:PermitRecallGTD">
							<xsl:for-each select="prg:SendDate">
								<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
								<xsl:text>.</xsl:text>
								<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
								<xsl:text>.</xsl:text>
								<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
							</xsl:for-each>
						</xsl:for-each> 
						<xsl:for-each select="prg:PermitRecallGTD">
							<xsl:for-each select="prg:SendTime">
								<xsl:value-of select="substring(., 1, 8)"/>
							</xsl:for-each>
						</xsl:for-each> 
					</td>
				</table>
				<br/>
				<table class="w190">
					<tbody>
						<tr>
							<td align="center" class="graphMain">
								<font size="4">
									<span style="font-weight:bold; ">Разрешение</span>
									<br/>
									<span style="font-size:medium; font-weight:bold; "> на отзыв декларации</span>
								</font>
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
				<table border="1" class="w190" style="width:100%">
						<tr>
							<td align="center" style="width:20%">
								<xsl:value-of select="prg:PermitRecallGTD/prg:Customs/cat_ru:Code"/>							
							</td>
							<td align="center" style="width:80%">
								<xsl:value-of select="prg:PermitRecallGTD/prg:Customs/cat_ru:OfficeName"/>							
							</td>
						</tr>
				</table>
				<br/>
				<br/>
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:36%">Разрешен отзыв декларации № </td>
						<td class="nnot graphMain" style="width:2%" align="center"></td>
						<td class="value graphMain" style="width:62%">
							<b>
							<xsl:value-of select="prg:PermitRecallGTD/prg:GTDNumber/cat_ru:CustomsCode"/>
							<xsl:text>/</xsl:text>
							<xsl:value-of select="format-number(substring(prg:PermitRecallGTD/prg:GTDNumber/cat_ru:RegistrationDate, 9, 2), '00')"/>
							<xsl:value-of select="format-number(substring(prg:PermitRecallGTD/prg:GTDNumber/cat_ru:RegistrationDate, 6, 2), '00')"/>
							<xsl:value-of select="format-number(substring(prg:PermitRecallGTD/prg:GTDNumber/cat_ru:RegistrationDate, 3, 2), '00')"/>
							<xsl:text>/</xsl:text>
							<xsl:value-of select="prg:PermitRecallGTD/prg:GTDNumber/cat_ru:GTDNumber"/>
							</b>
						</td>
					</tr>
				</table>
				<xsl:if test="string-length(  prg:PermitRecallGTD/prg:NewGTDdeadline  )  != 0">
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:36%">Срок подачи новой ДТ - </td>
							<td class="nnot graphMain" style="width:2%" align="center"></td>
							<td class="value graphMain" style="width:62%">
								<b>
								<xsl:value-of select="format-number(substring(prg:PermitRecallGTD/prg:NewGTDdeadline, 9, 2), '00')"/>
								<xsl:text>.</xsl:text>
								<xsl:value-of select="format-number(substring(prg:PermitRecallGTD/prg:NewGTDdeadline, 6, 2), '00')"/>
								<xsl:text>.</xsl:text>
								<xsl:value-of select="format-number(substring(prg:PermitRecallGTD/prg:NewGTDdeadline, 1, 4), '0000')"/>
								</b>
							</td>
						</tr>
					</table>
				</xsl:if>
            <br/>
            <br/>
				<table class="w190">
					<tr>
						<td class="value graphMain" style="width:75%" align="center">
							<xsl:value-of select="prg:PermitRecallGTD/prg:CustomsPerson/cat_ru:PersonName"/>
						</td>
						<td class="nnot graphMain" style="width:10%"></td>
						<td class="value graphMain" style="width:15%" align="center">
							<xsl:value-of select="prg:PermitRecallGTD/prg:CustomsPerson/cat_ru:LNP"/>
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
           </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>

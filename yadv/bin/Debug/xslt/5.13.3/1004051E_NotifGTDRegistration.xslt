<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:nGTDr="urn:customs.ru:Information:ExchangeDocuments:NotifGTDRegistration:5.13.3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
						<xsl:for-each select="nGTDr:NotifGTDRegistration">
							<xsl:for-each select="nGTDr:RegistrationDate">
								<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
								<xsl:text>.</xsl:text>
								<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
								<xsl:text>.</xsl:text>
								<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
							</xsl:for-each>
						</xsl:for-each> 
						<xsl:for-each select="nGTDr:NotifGTDRegistration">
							<xsl:for-each select="nGTDr:RegistrationTime">
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
									<span style="font-weight:bold; ">
										<xsl:choose>
											<xsl:when test="//nGTDr:DocSign='0'">Уведомление<br/>о регистрации ДТ</xsl:when>
											<xsl:when test="//nGTDr:DocSign='1'">Уведомление о регистрации<br/>Обязательства о подаче ДТ</xsl:when>
											<xsl:when test="//nGTDr:DocSign='2'">Уведомление о регистрации<br/>реестра экспресс-грузов</xsl:when>
											<xsl:when test="//nGTDr:DocSign='3'">Уведомление о регистрации сведений<br/>о поступлении товара на территорию УЭО</xsl:when>
											<xsl:when test="//nGTDr:DocSign='4'">Уведомление о регистрации<br/>заявления о выпуске до подачи</xsl:when>
											<xsl:otherwise>Документ </xsl:otherwise>
										</xsl:choose>
									</span>
								</font>
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
				<table border="1" class="w190" style="width:100%">
						<tr>
							<td align="center" style="width:20%">
								<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:Customs/cat_ru:Code"/>							
							</td>
							<td align="center" style="width:80%">
								<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:Customs/cat_ru:OfficeName"/>							
							</td>
						</tr>
				</table>
				<br/>
				<br/>
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:100%">
							<span>
								<xsl:variable name="CustomsCode">
									<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:GTDID/cat_ru:CustomsCode"/>
								</xsl:variable>
								<xsl:variable name="RegistrationDate">
									<xsl:value-of select="substring(nGTDr:NotifGTDRegistration/nGTDr:GTDID/cat_ru:RegistrationDate,9,2)"/>
									<xsl:value-of select="substring(nGTDr:NotifGTDRegistration/nGTDr:GTDID/cat_ru:RegistrationDate,6,2)"/>
									<xsl:value-of select="substring(nGTDr:NotifGTDRegistration/nGTDr:GTDID/cat_ru:RegistrationDate,3,2)"/>
								</xsl:variable>
								<xsl:variable name="GTDNumber">
									<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:GTDID/cat_ru:GTDNumber"/>
								</xsl:variable>
								<xsl:variable name="PrefixGTDNumber">
									<xsl:choose>
										<xsl:when test="//nGTDr:DocSign='4'">
											<xsl:value-of select="'ЗВ'"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="RefDocumentID">
									<xsl:value-of select="nGTDr:NotifGTDRegistration/cat_ru:RefDocumentID"/>
								</xsl:variable>
								<xsl:variable name="DocName">
									<xsl:choose>
										<xsl:when test="//nGTDr:DocSign='0'">
											<xsl:value-of select="'ДТ'"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'Документ'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="LastChar1">
									<xsl:choose>
										<xsl:when test="//nGTDr:DocSign='0'">
											<xsl:value-of select="''"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="'а'"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="LastChar2">
									<xsl:choose>
										<xsl:when test="//nGTDr:DocSign='0'">
											<xsl:value-of select="'а'"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="FirstStrDT">
									<xsl:value-of select="$DocName"/>
<!--
									<xsl:if test="(//nGTDr:DocSign!='0') and (//nGTDr:DocSign!='false') and (//nGTDr:DocSign!='f')">
											<span>вставить перевод строки</span>
									</xsl:if>
-->
									<xsl:choose>
										<xsl:when test="nGTDr:NotifGTDRegistration/cat_ru:RefDocumentID">
											<xsl:value-of select="concat(' (уникальный идентификатор ',$DocName,$LastChar1,': ',$RefDocumentID,')')"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat(' ',$DocName,$LastChar1,' не указан)')"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:value-of select="$FirstStrDT"/>
								<br/>
								<xsl:value-of select="concat('зарегистрирован',$LastChar2,' под № ')"/>
								<b><xsl:value-of select="concat($CustomsCode,'/',$RegistrationDate,'/',$PrefixGTDNumber,$GTDNumber)"/></b>
							</span>
						</td>
					</tr>
				</table>
				<br/>
				<br/>
				<table class="w190">
					<tr>
						<td class="value graphMain" style="width:75%" align="center">
							<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:CustomsPersonSignature/cat_ru:PersonName"/>
						</td>
						<td class="nnot graphMain" style="width:10%"></td>
						<td class="value graphMain" style="width:15%" align="center">
							<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:CustomsPersonSignature/cat_ru:LNP"/>
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
           </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>

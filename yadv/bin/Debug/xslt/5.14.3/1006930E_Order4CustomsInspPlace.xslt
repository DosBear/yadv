<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.3" xmlns:ocip="urn:customs.ru:Information:CustomsAuditDocuments:Order4CustomsInspPlace:5.14.3">
	<!-- Шаблон для типа Order4CustomsInspPlaceType -->
	<xsl:template match="ocip:Order4CustomsInspPlace">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
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
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



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
                  .descr{
                  font-size:8pt;
                  }
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" style="border-bottom:1px solid black;">
									<xsl:value-of select="ocip:CustomsIssued/cat_ru:OfficeName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="ocip:CustomsIssued/cat_ru:Code"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="descr">
									(наименование таможенного органа)
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td align="center">
									<b>ПРЕДПИСАНИЕ<br/>на проведение таможенного осмотра помещений и территорий</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="33%" align="left">
									<xsl:call-template name="date_month"><xsl:with-param name="dateIn" select="ocip:OrderNumber/adt_cat:Date"/></xsl:call-template><xsl:text> г.</xsl:text>
								</td>
								<td width="34%"></td>
								<td width="33%" align="right">
									<xsl:text>№ </xsl:text>
									<xsl:value-of select="ocip:OrderNumber/adt_cat:Number"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<p style="text-indent:10mm;">
						1. В соответствии со статьей 330 Таможенного кодекса Евразийского экономического союза и статьей 227 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации"
					</p>
					<p style="text-indent:5mm;font-weight:bold">ПОРУЧАЮ:</p>
					<xsl:for-each select="ocip:CustomsPerson">
						<table>
							<tbody>
								<tr>
									<td style="width:5mm;">
										<xsl:value-of select="position()"/><xsl:text>)</xsl:text>
									</td>
									<td style="border-bottom:1px solid black;">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
										<xsl:if test="cat_ru:PersonPost">
											<xsl:text>, </xsl:text>
											<xsl:value-of select="cat_ru:PersonPost"/>
										</xsl:if>
										<xsl:if test="ocip:PersonCustomsID">
											<xsl:text>, </xsl:text>
											<xsl:value-of select="ocip:PersonCustomsID"/>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td></td>
									<td class="descr" align="center">(инициалы, фамилия, должность, номер служебного удостоверения)</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
					<p>
						осмотреть помещение(я) (территорию), а также находящиеся в указанных местах товары и (или) документы по адресу 
						<u>
							<xsl:for-each select="ocip:AuditPlace/*">
								<xsl:if test="position()!=1">, </xsl:if>
								<xsl:value-of select="."/>
							</xsl:for-each>
						</u>
						<br/>
						c <xsl:call-template name="date_month"><xsl:with-param name="dateIn" select="ocip:StartDate"/></xsl:call-template><xsl:text> г.</xsl:text>
					</p>
					<p style="text-indent:10mm;">
						2. В случае отказа в доступе на территорию и в помещения должностные лица таможенных органов вправе входить на территорию и в помещения с пресечением сопротивления и со вскрытием запертых помещений в присутствии 2 (двух) понятых.
					</p>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>Начальник (заместитель начальника)<br/>таможенного органа</td>
								<td style="width:20%;border-bottom:1px solid black;"></td>
								<td style="width:5%;"></td>
								<td style="width:30%;border-bottom:1px solid black;" align="center">
									<xsl:value-of select="ocip:CustomsIssued/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="ocip:CustomsIssued/adt_cat:ApproverPerson/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="ocip:CustomsIssued/adt_cat:ApproverPerson/cat_ru:PersonMiddleName"/>
								</td>
							</tr>
							<tr>
								<td></td>
								<td class="descr" align="center">(подпись)</td>
								<td></td>
								<td class="descr" align="center">(инициалы, фамилия)</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:variable name="day" select="substring($dateIn,9,2)"/>
				<xsl:variable name="month" select="substring($dateIn,6,2)"/>
				<xsl:variable name="month_word">
					<xsl:choose>
						<xsl:when test="$month='01'">января</xsl:when>
						<xsl:when test="$month='02'">февраля</xsl:when>
						<xsl:when test="$month='03'">марта</xsl:when>
						<xsl:when test="$month='04'">апреля</xsl:when>
						<xsl:when test="$month='05'">мая</xsl:when>
						<xsl:when test="$month='06'">июня</xsl:when>
						<xsl:when test="$month='07'">июля</xsl:when>
						<xsl:when test="$month='08'">августа</xsl:when>
						<xsl:when test="$month='09'">сентября</xsl:when>
						<xsl:when test="$month='10'">октября</xsl:when>
						<xsl:when test="$month='11'">ноября</xsl:when>
						<xsl:when test="$month='12'">декабря</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="year" select="substring($dateIn,1,4)"/>
				<xsl:text>"</xsl:text><u><xsl:value-of select="$day"/></u><xsl:text>" </xsl:text><u><xsl:value-of select="$month_word"/></u><xsl:text> </xsl:text><u><xsl:value-of select="$year"/></u>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>

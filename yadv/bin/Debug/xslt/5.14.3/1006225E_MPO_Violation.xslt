<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mpov="urn:customs.ru:Information:CustomsDocuments:MPO_Violation:5.14.3">
	<!-- Шаблон для типа MPO_ViolationType -->
	<xsl:template match="mpov:MPO_Violation">
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
									font-size: 14pt;
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
								<td align="right" class="graphMain">
									Ф.51
								</td>
							</tr>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>АКТ № <xsl:value-of select="mpov:ActNumber"/><br/>на внешнее состояние отправления и разницу в весе</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td class="graphMain" colspan="2"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							</tr>
							<tr>
								<td class="graphMain">
									<xsl:text>Составлен </xsl:text>
									<xsl:if test="mpov:ActDate">
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mpov:ActDate"/></xsl:call-template> г.
									</xsl:if>
								</td>
								<td class="graphMain">
									<xsl:if test="mpov:MMPOName">
										<xsl:text> в </xsl:text>
										<xsl:value-of select="mpov:MMPOName"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							</tr>
							<tr>
								<td class="graphMain">
									<xsl:text>По депеше № </xsl:text>
									<xsl:value-of select="mpov:DispatchNumber"/>
								</td>
								<td class="graphMain">
									<xsl:text>от </xsl:text>
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mpov:DispatchDate"/></xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="graphMain">
									<xsl:text>откуда </xsl:text>
									<xsl:value-of select="mpov:AgencySender"/>
								</td>
								<td class="graphMain">
									<xsl:text>куда </xsl:text>
									<xsl:value-of select="mpov:AgencyReceiver"/>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2">
									<xsl:text>получено отправление </xsl:text>
									<xsl:if test="mpov:MPOKind/mpov:KindDescription">
										<xsl:text>"</xsl:text>
											<xsl:value-of select="mpov:MPOKind/mpov:KindDescription"/>
										<xsl:text>" </xsl:text>
									</xsl:if>
									<xsl:text>№ </xsl:text>
									<xsl:value-of select="mpov:MPO_Number"/>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2">
									<xsl:text>в адрес: </xsl:text>
									<xsl:value-of select="mpov:Consignee/mpov:FullAddress"/>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2">
									<xsl:text>на имя: </xsl:text>
									<xsl:value-of select="mpov:Consignee/cat_ru:OrganizationName"/>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2">
									При наружном осмотре оказалось:
									<table class="w190">
										<tbody>
											<tr>
												<td class="graphMain">
													<span style="width:4mm;height:4mm;border:1px solid;display:inline-block;font-family:Arial;">
														<xsl:if test="mpov:Information/mpov:PackingState='true' or mpov:Information/mpov:PackingState='t' or mpov:Information/mpov:PackingState='1'">X</xsl:if>
													</span>
													<xsl:text> Оболочка повреждена</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="graphMain">
													<span style="width:4mm;height:4mm;border:1px solid;display:inline-block;font-family:Arial;">
														<xsl:if test="mpov:Information/mpov:AccessState='true' or mpov:Information/mpov:AccessState='t' or mpov:Information/mpov:AccessState='1'">X</xsl:if>
													</span>
													<xsl:text> С доступом к вложению</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="graphMain">
													<span style="width:4mm;height:4mm;border:1px solid;display:inline-block;font-family:Arial;">
														<xsl:if test="mpov:Information/mpov:ExistState='true' or mpov:Information/mpov:ExistState='t' or mpov:Information/mpov:ExistState='1'">X</xsl:if>
													</span>
													<xsl:text> Без вложения</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="graphMain">
													<span style="width:4mm;height:4mm;border:1px solid;display:inline-block;font-family:Arial;">
														<xsl:if test="mpov:Information/mpov:WeightState='true' or mpov:Information/mpov:WeightState='t' or mpov:Information/mpov:WeightState='1'">X</xsl:if>
													</span>
													<xsl:text> С разницей в весе</xsl:text>
												</td>
											</tr>
											<xsl:if test="mpov:Information/mpov:Remark">
												<tr>
													<td class="graphMain">
														<xsl:value-of select="mpov:Information/mpov:Remark"/>
													</td>
												</tr>
											</xsl:if>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2">
									<xsl:text>Подавательский вес отправления: </xsl:text>
									<xsl:value-of select="format-number(mpov:TotalGrossWeight,'0.000')"/>
									<xsl.text> кг.</xsl.text>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2">
									<xsl:text>Фактический вес отправления: </xsl:text>
									<xsl:value-of select="format-number(mpov:MPOFactWeight,'0.000')"/>
									<xsl.text> кг.</xsl.text>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2">
									<b><xsl:text>ПОСТАНОВИЛИ:</xsl:text></b>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2">
									<xsl:for-each select="mpov:Comment">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()"><br/></xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2">
									<table class="w190">
										<tbody>
											<tr>
												<td width="20%">
													Начальник участка (смены)
												</td>
												<td width="40%" style="border-bottom:1pt solid;"></td>
												<td width="40%" style="border-bottom:1pt solid;" align="center">
													<xsl:apply-templates select="mpov:Cheif"/>
												</td>
											</tr>
											<tr>
												<td width="20%">
												</td>
												<td width="40%" align="center">
													(подпись)
												</td>
												<td width="40%" align="center">
													(ФИО)
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2">
									<table class="w190">
										<tbody>
											<tr>
												<td width="20%">
													Оператор
												</td>
												<td width="40%" style="border-bottom:1pt solid;"></td>
												<td width="40%" style="border-bottom:1pt solid;" align="center">
													<xsl:apply-templates select="mpov:Operator"/>
												</td>
											</tr>
											<tr>
												<td width="20%">
												</td>
												<td width="40%" align="center">
													(подпись)
												</td>
												<td width="40%" align="center">
													(ФИО)
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2" align="right">
									<span style="width:30mm;height:30mm;border:1pt solid;display:inline-block;"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></span>
									<br/>
									<span style="width:30mm;font-size:10pt;">(оттиск КПШ места<br/>формирования)</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
<xsl:template match="mpov:Cheif|mpov:Operator">
	<xsl:value-of select="."/>
	<!--xsl:value-of select="cat_ru:PersonSurname"/>
	<xsl:text> </xsl:text>
	<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
	<xsl:text>.</xsl:text>
	<xsl:if test="cat_ru:PersonMiddleName">
		<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
		<xsl:text>.</xsl:text>
	</xsl:if-->
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

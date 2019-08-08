<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fias_res="urn:customs.ru:Information:SQDocuments:FnsFiasResponse:5.13.1">
	<!-- Шаблон для типа FnsFiasResponseType -->
	<xsl:template match="fias_res:FnsFiasResponse">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: nowrap;
									}

									div.page {
									width: 270mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
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
										<b>Ответ на запрос на предоставление адресных сведений, содержащихся в Федеральной информационной системе (ФИАС)</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID"/></td>
						</tr>
						<xsl:if test="cat_ru:RefDocumentID">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID"/></td>
							</tr>
						</xsl:if>
					</table-->
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор документа (пакета запросов)</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fias_res:DocPackageId"/></td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Версия формата</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="fias_res:FormVersion"/>
							</td>
						</tr>
					</table>
					<xsl:if test="fias_res:Response">
						<div class="title marg-top">Ответ на запрос</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Идентификатор запроса в пакете</td>
									<td class="graphMain bordered">Дата формирования сведений из ФИАС</td>
									<td class="graphMain bordered">Идентификатор адресного объекта в ФИАС</td>
									<td class="graphMain bordered">Адресные сведения</td>
								</tr>
								<xsl:for-each select="fias_res:Response">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа fias_res:AddressElementsType -->
	<xsl:template match="fias_res:AddressElements">
		<xsl:if test="fias_res:Type">
			<xsl:value-of select="fias_res:Type"/>
			<xsl:text>: </xsl:text>  
		</xsl:if>	
		<xsl:value-of select="fias_res:Value"/>
		<xsl:if test="fias_res:NumberType or fias_res:NumberValue">, </xsl:if>
		<xsl:value-of select="fias_res:NumberType"/>
		<xsl:text> </xsl:text> 
		<xsl:value-of select="fias_res:NumberValue"/>
	</xsl:template>
	<!-- Шаблон для типа fias_res:AddressInfoType -->
	<xsl:template match="fias_res:AddressInfo">
		<xsl:text>Субъект РФ: </xsl:text>
		<xsl:value-of select="fias_res:SubjectRF"/>
		<xsl:if test="fias_res:District">
			<xsl:text>, округ: </xsl:text>
			<xsl:value-of select="fias_res:District"/>
		</xsl:if>
		<xsl:if test="fias_res:AdminDistrict">
			<xsl:text>, адм. район: </xsl:text>
			<xsl:value-of select="fias_res:AdminDistrict"/>
		</xsl:if>
		<xsl:if test="fias_res:MunicipalityDistrict">
			<xsl:text>, муниц. район: </xsl:text>
			<xsl:value-of select="fias_res:MunicipalityDistrict"/>
		</xsl:if>
		<xsl:if test="fias_res:MunicipalityCity">
			<xsl:text>, поселение: </xsl:text>
			<xsl:value-of select="fias_res:MunicipalityCity"/>
		</xsl:if>
		<xsl:if test="fias_res:City">
			<xsl:text>, город: </xsl:text>
			<xsl:value-of select="fias_res:City"/>
		</xsl:if>
		<xsl:if test="fias_res:UrbanDistrict">
			<xsl:text>, внутригородской район: </xsl:text>
			<xsl:value-of select="fias_res:UrbanDistrict"/>
		</xsl:if>
		<xsl:if test="fias_res:Locality">
			<xsl:text>, нас. пункт: </xsl:text>
			<xsl:value-of select="fias_res:Locality"/>
		</xsl:if>
		<xsl:if test="fias_res:Street">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="fias_res:Street"/>
		</xsl:if>
		<xsl:if test="fias_res:OKTMO">
			<xsl:text>, ОКТМО: </xsl:text>
			<xsl:value-of select="fias_res:OKTMO"/>
		</xsl:if>
		<xsl:if test="fias_res:OKATO">
			<xsl:text>, ОКАТО: </xsl:text>
			<xsl:value-of select="fias_res:OKATO"/>
		</xsl:if>
		<xsl:for-each select="fias_res:AddressElements">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:if test="fias_res:DocAddress">
			<xsl:text>, адрес по документу: </xsl:text>
			<xsl:value-of select="fias_res:DocAddress"/>
		</xsl:if>
		<xsl:if test="fias_res:Location">
			<xsl:text>, описание: </xsl:text>
			<xsl:for-each select="fias_res:Location"><xsl:value-of select="."/></xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа fias_res:ResponseType -->
	<xsl:template match="fias_res:Response">
		<tr>
			<td class="graphMain bordered" rowspan="{count(fias_res:AddressInfo)}">
				<xsl:value-of select="fias_res:RequestId"/>
			</td>
			<td class="graphMain bordered" rowspan="{count(fias_res:AddressInfo)}">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="fias_res:ResponseDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered" rowspan="{count(fias_res:AddressInfo)}">
				<xsl:for-each select="fias_res:FiasId">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="fias_res:AddressInfo[1]"/>
			</td>
		</tr>
		<xsl:for-each select="fias_res:AddressInfo[position() &gt; 1]">
			<tr>
				<td class="graphMain bordered"><xsl:apply-templates select="."/></td>
			</tr>
		</xsl:for-each>
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

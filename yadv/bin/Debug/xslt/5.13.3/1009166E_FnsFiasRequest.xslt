<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fias_req="urn:customs.ru:Information:SQDocuments:FnsFiasRequest:5.13.1">
	<!-- Шаблон для типа FnsFiasRequestType -->
	<xsl:template match="fias_req:FnsFiasRequest">
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
									width: 190mm;
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
										<b>Запрос на предоставление адресных сведений, содержащихся в Федеральной информационной системе (ФИАС)</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
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
					<div class="title marg-top">Сведения о юридическом лице - органе государственной власти, осуществляющем запрос</div>
					<xsl:apply-templates select="fias_req:ULInfo"/>
					<xsl:if test="fias_req:StrictSearch">
						<div class="title marg-top">Запрос сведений из ФИАС способом строгого поиска</div>
						<table class="w190">
							<xsl:for-each select="fias_req:StrictSearch/fias_req:Request[fias_req:AddressRF]">
								<tr>
									<td class="annot graphMain" style="width:50%">
										<xsl:if test="position()=1">Запрос сведений в формате 9 запятых</xsl:if> 
									</td>
									<td class="value graphMain" style="width:50%">
										<xsl:for-each select="fias_req:AddressRF"><xsl:value-of select="."/></xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="fias_req:StrictSearch/fias_req:Request[fias_req:FiasId]">
								<tr>
									<td class="annot graphMain" style="width:50%">
										<xsl:if test="position()=1">Запрос сведений по GUID</xsl:if> 
									</td>
									<td class="value graphMain" style="width:50%"><xsl:value-of select="fias_req:FiasId"/></td>
								</tr>
							</xsl:for-each>
						</table>	
					</xsl:if>
					<xsl:if test="fias_req:ExpandedSearch">
						<div class="title marg-top">Запрос сведений из ФИАС способом расширенного поиска</div>
						<table class="w190">
							<xsl:for-each select="fias_req:ExpandedSearch/fias_req:Request">
								<tr>
									<td class="annot graphMain" style="width:1%"/>
									<td class="value graphMain" style="width:99%"><xsl:apply-templates select="."/></td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа fias_req:AddressElementsType -->
	<xsl:template match="fias_req:AddressElements">
		<xsl:if test="fias_req:Type">
			<xsl:value-of select="fias_req:Type"/>
			<xsl:text>: </xsl:text>
		</xsl:if>
		<xsl:value-of select="fias_req:Value"/>
		<xsl:if test="fias_req:NumberType or fias_req:NumberValue">, </xsl:if>
		<xsl:value-of select="fias_req:NumberType"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="fias_req:NumberValue"/>
	</xsl:template>
	<xsl:template match="fias_req:Request">
		<xsl:text>Субъект РФ: </xsl:text>
		<xsl:value-of select="fias_req:SubjectRF"/>
		<xsl:if test="fias_req:District">
			<xsl:text>, округ: </xsl:text>
			<xsl:value-of select="fias_req:District"/>
		</xsl:if>
		<xsl:if test="fias_req:AdminDistrict">
			<xsl:text>, адм. район: </xsl:text>
			<xsl:value-of select="fias_req:AdminDistrict"/>
		</xsl:if>
		<xsl:if test="fias_req:MunicipalityDistrict">
			<xsl:text>, муниц. район: </xsl:text>
			<xsl:value-of select="fias_req:MunicipalityDistrict"/>
		</xsl:if>
		<xsl:if test="fias_req:MunicipalityCity">
			<xsl:text>, поселение: </xsl:text>
			<xsl:value-of select="fias_req:MunicipalityCity"/>
		</xsl:if>
		<xsl:if test="fias_req:City">
			<xsl:text>, город: </xsl:text>
			<xsl:value-of select="fias_req:City"/>
		</xsl:if>
		<xsl:if test="fias_req:UrbanDistrict">
			<xsl:text>, внутригородской район: </xsl:text>
			<xsl:value-of select="fias_req:UrbanDistrict"/>
		</xsl:if>
		<xsl:if test="fias_req:Locality">
			<xsl:text>, нас. пункт: </xsl:text>
			<xsl:value-of select="fias_req:Locality"/>
		</xsl:if>
		<xsl:if test="fias_req:Street">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="fias_req:Street"/>
		</xsl:if>
		<xsl:if test="fias_req:OKTMO">
			<xsl:text>, ОКТМО: </xsl:text>
			<xsl:value-of select="fias_req:OKTMO"/>
		</xsl:if>
		<xsl:if test="fias_req:OKATO">
			<xsl:text>, ОКАТО: </xsl:text>
			<xsl:value-of select="fias_req:OKATO"/>
		</xsl:if>
		<xsl:for-each select="fias_req:AddressElements">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:if test="fias_req:DocAddress">
			<xsl:text>, адрес по документу: </xsl:text>
			<xsl:value-of select="fias_req:DocAddress"/>
		</xsl:if>
		<xsl:if test="fias_req:Location">
			<xsl:text>, описание: </xsl:text>
			<xsl:for-each select="fias_req:Location"><xsl:value-of select="."/></xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа fias_req:UlInfoType -->
	<xsl:template match="fias_req:ULInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код органа гос. власти по общероссийскому классификатору ОКОГУ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="fias_req:OKOGU"/>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование юридического лица</td>
				<td class="graphMain value" style="width:50%">
					<xsl:for-each select="fias_req:ULName">
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">ИНН</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="fias_req:INNUL"/>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">ОГРН</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="fias_req:OGRN"/>
				</td>
			</tr>
		</table>
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

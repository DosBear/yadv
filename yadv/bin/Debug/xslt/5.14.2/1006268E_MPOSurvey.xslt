<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.14.2" xmlns:mps="urn:customs.ru:Information:CustomsDocuments:MPOSurvey:5.14.2">
	<!-- Шаблон для типа MPOSurveyType -->
	<xsl:template match="mps:MPOSurvey">
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
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Результаты осмотра МПО с применением ДРТ</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="cat_ru:DocumentID" />
              </td>
            </tr>
          </table>
          <xsl:if test="cat_ru:RefDocumentID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="cat_ru:RefDocumentID" />
                </td>
              </tr>
            </table>
          </xsl:if-->
					<xsl:if test="mps:Reestr_ID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный номер реестра</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mps:Reestr_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mps:MPOReestr">
						<div class="title marg-top">Регистрационный номер реестра МПО</div>
						<div>
							<xsl:apply-templates select="mps:MPOReestr">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mps:MPO_Registration">
						<div class="title marg-top">Регистрационный номер МПО</div>
						<div>
							<xsl:apply-templates select="mps:MPO_Registration">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mps:DocDate">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время формирования документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_datetime">
										<xsl:with-param name="dateIn" select="mps:DocDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mps:Return">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Признак необходимости возврата МПО</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="mps:Return='true'">
											<xsl:text>есть</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>нет</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mps:ReasonReturn">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Причина возврата товаров отправителю</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mps:ReasonReturn"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mps:Inspection">
						<div class="title marg-top">Результаты осмотра МПО</div>
						<div>
							<xsl:apply-templates select="mps:Inspection">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:CustomsPersonDetails -->
	<xsl:template match="mps:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PersonPost"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CustomsCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="RUScat_ru:CustomsCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mps:InspectionType -->
	<xsl:template match="mps:Inspection">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="mps:CustomsPerson">
				<div class="title marg-top">Должностное лицо ТО</div>
				<div>
					<xsl:apply-templates select="mps:CustomsPerson">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время проведения осмотра</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_datetime">
							<xsl:with-param name="dateIn" select="mps:InspectionTime"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
			<xsl:if test="mps:DisplayTime">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата и время предъявления МПО на осмотр</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_datetime">
								<xsl:with-param name="dateIn" select="mps:DisplayTime"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mps:PackingState">
				<div class="title marg-top">Сведения об упаковке</div>
				<div>
					<xsl:apply-templates select="mps:PackingState">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="mps:Prohibited">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак наличия запрещенных вложений</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="mps:Prohibited='true'">
									<xsl:text>есть</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>нет</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mps:Perquisition">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак необходимости проведения досмотра</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="mps:Perquisition='true'">
									<xsl:text>есть</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>нет</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mps:Comment">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Комментарии</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="mps:Comment">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpco:MPO_RegistrationType -->
	<xsl:template match="mps:MPOReestr">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="mpco:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="mpco:RegistrationDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный номер МПО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="mpco:MPO_Number"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpco:MPO_RegistrationType -->
	<xsl:template match="mps:MPO_Registration">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="mpco:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="mpco:RegistrationDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный номер МПО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="mpco:MPO_Number"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpco:PackingStateType -->
	<xsl:template match="mps:PackingState">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%"></td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="mpco:Value='false' or mpco:Value='0'">
								<xsl:text>нарушена</xsl:text>
							</xsl:when>
							<xsl:when test="mpco:Value='true' or mpco:Value='1'">
								<xsl:text>целостна</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="mpco:Value"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:if test="mpco:Remark">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Пояснение</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="mpco:Remark"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
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
	<xsl:template name="russian_datetime">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text>   </xsl:text>
				<xsl:value-of select="substring($dateIn,12,8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="pit cat_ru catTreat_ru" version="1.0" xmlns:catTreat_ru="urn:customs.ru:Information:TreatmentDocuments:TreatmentCommonAggregateTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pit="urn:customs.ru:Information:TreatmentDocuments:PermitInoTreatment:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 4.7.0.0 от 25.02.2009.   -->
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="pit:PermitInoTreatment">
      <html>
         <head>
            <title>Разрешение на переработку товаров вне таможенной территории</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
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
									.bordered { border-collapse: collapse;}
									td.bordered
									{
									border: solid 1px windowtext;
									valign: top;
									}

									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}				</style>
         </head>
         <body class="graph">
            <div class="page">
				<table class="w190">
					<tbody>
						<!--tr align="center">
							<td colspan="2"><font size="4" style="bold"><b>Разрешение на переработку товаров вне таможенной территории</b></font></td>
						</tr-->
						<tr align="center">
							<td colspan="2"><font size="4"><b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</b></font><br/></td>
						</tr>
						<tr>
							<td class="value graphMain" width="70%">
								<xsl:value-of select="pit:RegionalCustoms"/>
							</td>
							<td class="annot grapnMain" align="left" width="30%">таможенное управление</td>
						</tr>
						<tr>
							<td align="center"><i>(наименование регионального таможенного управления)</i></td>
							<td></td>
						</tr>
						<tr>
							<td class="value graphMain" width="70%">
								<xsl:value-of select="pit:Customs/cat_ru:Code"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:if test="pit:Customs/cat_ru:OfficeName">
									<xsl:value-of select="pit:Customs/cat_ru:OfficeName"/>
								</xsl:if>
							</td>
							<td class="annot grapnMain" align="left">таможня</td>
						</tr>
						<tr>
							<td align="center"><i>(наименование таможни)</i></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><font size="3"><b>Разрешение<br/>на переработку товаров вне таможенной территории<br/>№ <u>
								<xsl:value-of select="pit:PermitNumber"/>
								<xsl:text> от </xsl:text>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="pit:SendDate"/>
								</xsl:call-template>
							</u></b></font></td>
						</tr>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td>1. Выдано:</td>
						</tr>
						<tr>
							<td>
								<xsl:apply-templates select="pit:PermitHolder"/>
							</td>
						</tr>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td colspan="5">2. Товары для переработки</td>
						</tr>
						<tr>
							<td class="bordered graphMain" align="center">Наименование товаров</td>
							<td class="bordered graphMain" align="center">Код по ТН ВЭД ЕАЭС</td>
							<td class="bordered graphMain" align="center">Количество товаров в единицах измерения по ТН ВЭД ЕАЭС*</td>
							<td class="bordered graphMain" align="center">Стоимость,<br/>руб.</td>
							<td class="bordered graphMain" align="center">Таможенный орган</td>
						</tr>
						<tr>
							<td class="bordered graphMain" align="center">1</td>
							<td class="bordered graphMain" align="center">2</td>
							<td class="bordered graphMain" align="center">3</td>
							<td class="bordered graphMain" align="center">4</td>
							<td class="bordered graphMain" align="center">5</td>
						</tr>
						<xsl:apply-templates select="pit:Treatment/catTreat_ru:TreatmentGoods/catTreat_ru:TrGoodsItem"/>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td>3. Нормы выхода продуктов переработки:</td>
						</tr>
						<tr>
							<td>
								<xsl:for-each select="pit:Treatment/catTreat_ru:YieldNorm">
									<xsl:value-of select="."/>
									<!--xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text-->
								</xsl:for-each>
							</td>
						</tr>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td colspan="5">4. Продукты переработки</td>
						</tr>
						<tr>
							<td class="bordered graphMain" align="center">Наименование товаров</td>
							<td class="bordered graphMain" align="center">Код по ТН ВЭД ЕАЭС</td>
							<td class="bordered graphMain" align="center">Количество товаров в единицах измерения по ТН ВЭД ЕАЭС*</td>
							<td class="bordered graphMain" align="center">Стоимость,<br/>руб.</td>
							<td class="bordered graphMain" align="center">Таможенный орган</td>
						</tr>
						<tr>
							<td class="bordered graphMain" align="center">1</td>
							<td class="bordered graphMain" align="center">2</td>
							<td class="bordered graphMain" align="center">3</td>
							<td class="bordered graphMain" align="center">4</td>
							<td class="bordered graphMain" align="center">5</td>
						</tr>
						<xsl:apply-templates select="pit:Treatment/catTreat_ru:TrResult/catTreat_ru:TrResultItem"/>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td>5. Краткое описание операций по переработке товаров:</td>
						</tr>
						<tr>
							<td>
								<xsl:for-each select="pit:Treatment/catTreat_ru:TreatmentOperations">
								  <xsl:value-of select="catTreat_ru:OperationName"/>
								  <xsl:if test="catTreat_ru:OperationMethod">, 
												<xsl:for-each select="catTreat_ru:OperationMethod">
										<xsl:value-of select="."/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									 </xsl:for-each>
								  </xsl:if>
								  <xsl:if test="catTreat_ru:OperationEndDate">, срок завершения операции:
												<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="catTreat_ru:OperationEndDate"/>
									 </xsl:call-template>
								  </xsl:if>
								  <br/>
							   </xsl:for-each>
							</td>
						</tr>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td>6. Способы идентификации вывозимых товаров в продуктах их переработки:</td>
						</tr>
						<tr>
							<td>
							    <xsl:if test="pit:Treatment/catTreat_ru:TrResult/catTreat_ru:IdentificationMethod">
									<!--Способы идентификации товаров в продуктах переработки: -->
									<xsl:for-each select="pit:Treatment/catTreat_ru:TrResult/catTreat_ru:IdentificationMethod">
										<xsl:value-of select="."/>
										<!--xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text-->
									</xsl:for-each>
							   </xsl:if>
							   <xsl:if test="pit:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteIdentMethod">
								  <br/>
									<!--Способы идентификации товаров в отходах: -->
									<xsl:for-each select="pit:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteIdentMethod">
										<xsl:value-of select="."/>
										<!--xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text-->
									</xsl:for-each>
							   </xsl:if>
							</td>
						</tr>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td>7. Лицо (лица), непосредственное совершающее (совершающие) операции по переработке товаров:</td>
						</tr>
						<tr>
							<td>
							<xsl:for-each select="pit:Treatment/catTreat_ru:ProcOrganization">
								<xsl:apply-templates select="."/>
                            </xsl:for-each>
							</td>
						</tr>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td style="text-align:justify">8. Наименование и реквизиты документов, подтверждающих совершение внешнеэконо-мической сделки, в соответствии с которой вывозятся на переработку товары и непосредственно осуществляются операции по переработке вывезенных товаров (включая дополнения, изменения, имеющие отношения к вывозимым товарам) либо иных документов, подтверждающих право владения, пользования и (или) распоряжения товарами не в рамках внешнеэкономический сделки:</td>
						</tr>
						<tr>
							<td>
							    <xsl:for-each select="pit:BaseTreatmentDocs">
									<xsl:value-of select="cat_ru:PrDocumentName"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="cat_ru:PrDocumentNumber"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
									</xsl:call-template>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="catTreat_ru:CompanyName"/>
									<br/>
								</xsl:for-each>
							</td>
						</tr>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td>9. Срок переработки:</td>
							<td class="value graphMain" align="center"><xsl:value-of select="pit:Treatment/catTreat_ru:DateLimit/catTreat_ru:GeneralTerm"/></td>
						</tr>
						<tr>
							<td></td>
							<td align="center"><i>(указывается в полных календарных месяцах)</i></td>
						</tr>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td>10. Сведения о замене продуктов переработки иностранными товарами:</td>
						</tr>
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td><xsl:apply-templates select="pit:Treatment/catTreat_ru:ReplaceInf"/></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td>11. Особые отметки таможни:</td>
						</tr>
						<tr>
							<td>
								<xsl:for-each select="pit:Comments">
									<xsl:value-of select="."/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><br/>
								</xsl:for-each>
							</td>
						</tr>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td>Начальник таможни<br/>(либо лицо, его заменяющее)</td>
							<td class="value graphMain">
								<table>
									<tbody>
										<tr>
											<td align="left">
												<xsl:value-of select="substring(pit:Signature/cat_ru:PersonName,1,1)"/>
												<xsl:text>.</xsl:text>
												<xsl:if test="pit:Signature/cat_ru:PersonMiddleName">
													<xsl:value-of select="substring(pit:Signature/cat_ru:PersonMiddleName,1,1)"/>
													<xsl:text>.</xsl:text>
												</xsl:if>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="pit:Signature/cat_ru:PersonSurname"/>
											</td>
											<td align="right">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="pit:Signature/cat_ru:IssueDate"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td></td>
							<td align="center"><i>(инициалы, фамилия) (подпись, дата)</i></td>
						</tr>
						<tr>
							<td colspan="2">Печать таможни</td>
						</tr>
					</tbody>
				</table>
				<br/><br/>
				<table>
					<tbody>
						<tr>
							<td>
								<font size="1">____________________<br/>
									<i>
							* Если есть необходимость, то могут указываться и другие единицы измерения, обычно используемые для измерения количества товаров.<br/>
							<!--** Если есть необходимость, то могут указываться и другие единицы измерения, обычно используемые для измерения количества товаров.-->
									</i>
								</font> 
							</td>
						</tr>
					</tbody>
				</table>
            </div>
         </body>
      </html>
   </xsl:template>
   <!--xsl:template match="catTreat_ru:RubBankInformation | catTreat_ru:ValBankInformation">
		<xsl:apply-templates/>
	</xsl:template-->
   <xsl:template match="catTreat_ru:RubBankInformation | catTreat_ru:ValBankInformation">
      <table border="0" style="width:180mm">
         <tbody>
            <tr>
               <td class="graph" style="width:90mm;">
				<!--Банк:<br/>-->
                  <xsl:value-of select="./catTreat_ru:BankName"/>
                  <!--br/>
				ОКПО
		<xsl:value-of select="./catTreat_ru:BankOKPO"/-->
                  <xsl:if test="./catTreat_ru:BankMFO">
			МФО 
					<xsl:value-of select="./catTreat_ru:BankMFO"/>
                     <!--xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text-->
                  </xsl:if>
               </td>
               <!--td class="graph" style="width:90mm;">
                  <xsl:for-each select="./catTreat_ru:BankAccount">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="catTreat_ru:BankAccountDescription"/>
			№ <xsl:value-of select="catTreat_ru:BankAccount"/>,
			<br/>
                  </xsl:for-each>
               </td-->
            </tr>
         </tbody>
      </table>
      <br/>
   </xsl:template>
   <xsl:template match="pit:PermitHolder | catTreat_ru:ProcOrganization">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			(<xsl:value-of select="cat_ru:ShortName"/>)
	  </xsl:if>
      <br/>
      <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
			ОГРН 
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
      </xsl:if>
      <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
			ИНН 
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
      </xsl:if>
      <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
			КПП 
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
      </xsl:if>
      <br/>
      <xsl:if test="catTreat_ru:Phone">
			тел.
			<xsl:value-of select="catTreat_ru:Phone"/>
      </xsl:if>
      <xsl:if test="catTreat_ru:Fax">
			факс: 
			<xsl:value-of select="catTreat_ru:Fax"/>
      </xsl:if>
      <xsl:if test="catTreat_ru:Telex">
			телекс
			<xsl:value-of select="catTreat_ru:Telex"/>
      </xsl:if>
      <br/>
      <xsl:if test="catTreat_ru:LegalAddress">
		Юридический адрес:
			<xsl:apply-templates select="catTreat_ru:LegalAddress"/>
         <br/>
      </xsl:if>
      <xsl:if test="catTreat_ru:Address">
		Адрес:
			<xsl:apply-templates select="catTreat_ru:Address"/>
         <br/>
      </xsl:if>
      <xsl:if test="catTreat_ru:FactAddress">
		Фактический адрес:
			<xsl:apply-templates select="catTreat_ru:FactAddress"/>
         <br/>
      </xsl:if>
      <xsl:if test="catTreat_ru:RubBankInformation">
         <br/>
			Рублевый счет:
		 <br/>
         <xsl:apply-templates select="catTreat_ru:RubBankInformation"/>
         <br/>
      </xsl:if>
      <xsl:if test="catTreat_ru:ValBankInformation">
		Валютный счет:
		 <br/>
         <xsl:apply-templates select="catTreat_ru:ValBankInformation"/>
         <br/>
      </xsl:if>
   </xsl:template>
   <!--шаблоны для таблиц-->
    <xsl:template match="catTreat_ru:SubstituteItem">
      <xsl:for-each select=".">
         <tr>
            <td align="center" class="bordered graph" style="width:50mm;">
               <xsl:for-each select="catTreat_ru:Name">
                  <xsl:value-of select="."/>
               </xsl:for-each>
            </td>
            <td align="center" class="bordered graph" style="width:20mm;">
               <xsl:value-of select="catTreat_ru:TNVED"/>
            </td>
            <td align="center" class="bordered graph" style="width:20mm;">
               <xsl:if test="catTreat_ru:QuantityKg">
                  <xsl:value-of select="catTreat_ru:QuantityKg"/> кг
															</xsl:if>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="catTreat_ru:GoodsQuantity"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="catTreat_ru:MeasureUnitQualifierName"/>
            </td>
            <td align="center" class="bordered graph" style="width:20mm;">
               <xsl:value-of select="catTreat_ru:RubCost"/> руб.
            </td>
         </tr>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="catTreat_ru:TrGoodsItem | catTreat_ru:TrResultItem | catTreat_ru:WasteProductsItem | catTreat_ru:LossItem | catTreat_ru:HeelsItem">
      <xsl:for-each select=".">
         <tr>
            <td align="center" class="bordered graph" style="width:50mm;">
               <xsl:for-each select="catTreat_ru:Name">
                  <xsl:value-of select="."/>
               </xsl:for-each>
            </td>
            <td align="center" class="bordered graph" style="width:20mm;">
               <xsl:value-of select="catTreat_ru:TNVED"/>
            </td>
            <td align="center" class="bordered graph" style="width:20mm;">
               <xsl:if test="catTreat_ru:QuantityKg">
                  <xsl:value-of select="catTreat_ru:QuantityKg"/> кг
				</xsl:if>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="catTreat_ru:AddQuantity"/>
               <xsl:if test="catTreat_ru:AddUnit">
					(код  <xsl:value-of select="catTreat_ru:AddUnit"/>)
				</xsl:if>
            </td>
            <td align="center" class="bordered graph" style="width:20mm;">
               <xsl:value-of select="catTreat_ru:RubCost"/><!-- руб. -->
				<xsl:if test="catTreat_ru:CurrencyCost">
					, <xsl:value-of select="catTreat_ru:CurrencyCost/catTreat_ru:CurrencyCost"/>
					(код  <xsl:value-of select="catTreat_ru:CurrencyCost/catTreat_ru:CurrencyCode"/>)
				</xsl:if>
            </td>
            <td align="center" class="bordered graph" style="width:20mm;">
               <xsl:value-of select="catTreat_ru:CustomsCode"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </td>
         </tr>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="catTreat_ru:TreatmentOrganizationAddress | catTreat_ru:Address | cat_ru:Address | catTreat_ru:LegalAddress | catTreat_ru:FactAddress">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="catTreat_ru:TreatmentOrganizationAddress/* | catTreat_ru:Address/* | catTreat_ru:LegalAddress/* | cat_ru:Address/* | catTreat_ru:FactAddress/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
</xsl:stylesheet>

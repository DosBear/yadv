<?xml version="1.0" encoding="UTF-8"?>
<!-- 
Бланки регламентированы приказом ФТС от 23.06.2015г. № 1232, Приложения 1 - 6 
-->
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.14.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.0" xmlns:gcd="urn:customs.ru:Information:CustomsDocuments:GoodsClassificationDecision:5.14.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Решение о классификации товара</title>
            <style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                        font-family: Arial;
                        line-height: 1;
                    }

                    div.pagePortrait {
                        width: 210mm;
                        margin: 10pt auto;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                        text-align: left;
                    }

                    h2 {
                        text-align: center;
                    }

                    table {
                        border: 1px solid #000000;
                        vertical-align: top;
                        border-collapse: collapse;
                    }

                    td {
                        vertical-align: top;
                        border: 1px solid #000000;
                    }

                    div.pagePortrait table tbody tr td {
                        padding: 10px 5px;
                    }

                    table.custPerson {
                        width: 100%;
                        border-collapse: separate;
                    }

                    table.custPerson, table.custPerson tr td {
                        border: none;
                        margin-top: 10px;
                        border-spacing: 8px 0;
                    }

                    table.custPerson tr td.graphUnderline {
                        padding: 0 6px;
                    }

                    table.custPerson tr td.graphUnderline {
                        border: none;
                        border-bottom: 1px dotted black;
                        text-align: center;
                        vertical-align: bottom;
                    }

                    td.graph, table.custPerson tr td.graph {
                        border: none;
                        font-size: 90%;
                        text-align: center;
                        padding: 0;
                        spacing: 0;
                        white-space: normal;
                    }

                    span {
                        text-decoration: underline;
                    }
                    
                    .header{
						text-align: center;
                    }

                    @media print {
                        div.pagePortrait {
                            border: none;
                        }
                    }
                </style>
         </head>
         <body>
            <xsl:apply-templates select="gcd:GoodsClassificationDecision"/>
         </body>
      </html>
   </xsl:template>
   <!-- Документы -->
   <xsl:template match="gcd:Documents">
	   <xsl:if test="cat_ru:PrDocumentName">
		   <xsl:value-of select="cat_ru:PrDocumentName"/>
	   </xsl:if>
	   <xsl:if test="cat_ru:PrDocumentNumber">
		   № <xsl:value-of select="cat_ru:PrDocumentNumber"/>
	   </xsl:if>
	   <xsl:if test="cat_ru:PrDocumentDate">
		   от <xsl:call-template name="dateRussian"><xsl:with-param name="text" select="cat_ru:PrDocumentDate"/></xsl:call-template>
	   </xsl:if>
	   <xsl:if test="position()!=last()"><br/></xsl:if>
   </xsl:template>
   <!-- Характеристики товара -->
   <xsl:template match="gcd:GoodsInformation">
		марка <xsl:value-of select="gcd:GoodsMark"/>
		<xsl:if test="gcd:GoodsModel">
			<xsl:text>, модель </xsl:text>
			<xsl:value-of select="gcd:GoodsModel"/>
		</xsl:if>
		<xsl:if test="gcd:GoodsMarking">
			<xsl:text>, артикул </xsl:text>
			<xsl:value-of select="gcd:GoodsMarking"/>
		</xsl:if>
		<xsl:if test="gcd:GoodsOtherInfo">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="gcd:GoodsOtherInfo"/>
		</xsl:if>
   </xsl:template>
   <!-- Адрес -->
   <xsl:template match="cat_ru:Address">
	   <xsl:for-each select="*">
		   <xsl:value-of select="."/>
		   <xsl:if test="position()!=last()">, </xsl:if>
	   </xsl:for-each>
   </xsl:template>
   <!-- Декларант -->
   <xsl:template match="gcd:Declarant">
	   <xsl:if test="gcd:Chief">
		   <xsl:if test="gcd:Chief/cat_ru:PersonPost">
			   <xsl:value-of select="gcd:Chief/cat_ru:PersonPost"/><xsl:text>: </xsl:text>
		   </xsl:if>
		   <xsl:value-of select="gcd:Chief/cat_ru:PersonSurname"/>
		   <xsl:text> </xsl:text>
		   <xsl:value-of select="gcd:Chief/cat_ru:PersonName"/>
		   <xsl:text> </xsl:text>
		   <xsl:value-of select="gcd:Chief/cat_ru:PersonMiddleName"/>
		   <br/>
	   </xsl:if>
	   <xsl:if test="cat_ru:OrganizationName">
		   <xsl:value-of select="cat_ru:OrganizationName"/><br/>
	   </xsl:if>
	   <xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
		   <xsl:value-of select="cat_ru:ShortName"/><br/>
	   </xsl:if>
	   <xsl:if test="cat_ru:Address">
		   <xsl:apply-templates select="cat_ru:Address"/>
	   </xsl:if>
	   <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
		   ОГРН <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
	   </xsl:if>
	   <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
		   ИНН <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
	   </xsl:if>
   </xsl:template>
   <!-- Регистраницонный номер-->
   <xsl:template match="gcd:RegistryNumber|gcd:PrecedingDecisionRegNumber">
      <xsl:value-of select="gcd:IDDoc"/>
      <xsl:text>/</xsl:text>
      <xsl:value-of select="gcd:CountryCode"/>
      <xsl:text>/</xsl:text>
      <xsl:value-of select="gcd:CustomsCode"/>
      <xsl:text>/</xsl:text>
      <xsl:value-of select="substring(gcd:Date, 3, 2)"/>
      <xsl:text>/</xsl:text>
      <xsl:value-of select="gcd:SerialNumber"/>
   </xsl:template>
   <!-- Подпись должностного лица -->
   <xsl:template match="gcd:CustomsPerson">
      <table class="custPerson">
         <tbody>
            <tr>
               <td class="graphUnderline" style="width: 30%">
                  <xsl:value-of select="cat_ru:PersonPost"/>
               </td>
               <td style="width: 5%;"/>
               <td class="graphUnderline" style="width: 30%"><br/></td>
               <td style="width: 5%;"/>
               <td class="graphUnderline" style="width: 30%">
                  <xsl:value-of select="cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="cat_ru:PersonMiddleName"/>
               </td>
            </tr>
            <tr>
               <td class="graph">(должность)</td>
               <td/>
               <td class="graph">(подпись)</td>
               <td/>
               <td class="graph">(Ф.И.О.)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <!-- Отображает название месяца по его номеру -->
   <xsl:template name="monthName">
      <xsl:param name="month"/>
      <xsl:choose>
         <xsl:when test="$month = '01'">января</xsl:when>
         <xsl:when test="$month = '02'">февраля</xsl:when>
         <xsl:when test="$month = '03'">марта</xsl:when>
         <xsl:when test="$month = '04'">апреля</xsl:when>
         <xsl:when test="$month = '05'">мая</xsl:when>
         <xsl:when test="$month = '06'">июня</xsl:when>
         <xsl:when test="$month = '07'">июля</xsl:when>
         <xsl:when test="$month = '08'">августа</xsl:when>
         <xsl:when test="$month = '09'">сентября</xsl:when>
         <xsl:when test="$month = '10'">октября</xsl:when>
         <xsl:when test="$month = '11'">ноября</xsl:when>
         <xsl:when test="$month = '12'">декабря</xsl:when>
      </xsl:choose>
   </xsl:template>
   <!--Шаблон для отображения даты по стандартам русской локали-->
   <xsl:template name="dateRussian">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
               <xsl:value-of select="substring($text,9,2)"/>
               <xsl:text>.</xsl:text>
               <xsl:value-of select="substring($text,6,2)"/>
               <xsl:text>.</xsl:text>
               <xsl:value-of select="substring($text,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--Шаблон для отображения даты по стандартам русской локали (месяц прописью)-->
   <xsl:template name="date">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
            <xsl:text>«</xsl:text>
            <!--span-->
               <xsl:value-of select="substring($text,9,2)"/>
               <xsl:text>» </xsl:text>
               <xsl:call-template name="monthName">
                  <xsl:with-param name="month" select="substring($text,6,2)"/>
               </xsl:call-template>
               <xsl:text> </xsl:text>
               <xsl:value-of select="substring($text,1,4)"/>
            <!--/span-->
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- Шаблон отображения даты -->
   <xsl:template match="cat_ru:IssueDate">
      <b>Дата</b>
      <xsl:text> </xsl:text>
      <xsl:call-template name="date">
         <xsl:with-param name="text" select="."/>
      </xsl:call-template>
   </xsl:template>
   <!-- таблица приложения -->
   <xsl:template name="application">
	   <div class="pagePortrait">
		   <table>
				<tbody>
					<tr style="text-align:center">
						<td>N компонента</td>
						<xsl:if test="gcd:RegistryNumber/gcd:IDDoc='ИЗ'">
							<td>Признак изменения</td>
						</xsl:if>
						<td>Наименование компонента</td>
						<td>Код ТН ВЭД ЕАЭС</td>
						<td>Количество</td>
						<td>Единица измерения</td>
						<td>Вес нетто (кг)</td>
					</tr>
					<tr style="text-align:center">
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<xsl:if test="gcd:RegistryNumber/gcd:IDDoc='ИЗ'">
							<td>7</td>
						</xsl:if>
					</tr>
					<xsl:for-each select="//gcd:ComponentList">
						<xsl:variable name="numPosition" select="position()"/>
						<tr>
							<td align="left" style="padding-left:5mm">
								<xsl:value-of select="position()"/>.
							</td>
							<xsl:if test="../gcd:RegistryNumber/gcd:IDDoc='ИЗ'">
								<td align="center">
									<xsl:choose>
										<xsl:when test="RUDECLcat:ChangeAction='1'">добавление</xsl:when>
										<xsl:when test="RUDECLcat:ChangeAction='2'">изменение</xsl:when>
										<xsl:when test="RUDECLcat:ChangeAction='3'">исключение</xsl:when>
										<xsl:otherwise><xsl:value-of select="RUDECLcat:ChangeAction"/></xsl:otherwise>
									</xsl:choose>
								</td>
							</xsl:if>
							<td align="center">
								<xsl:value-of select="RUDECLcat:ComponentName"/>
							</td>
							<td align="center" >
								<xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/>
							</td>
							<td align="center" >
								<xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
							</td>
							<td align="center" >
								<xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
								(<xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)
							</td>
								<td align="center" >
								<xsl:value-of select="catESAD_cu:KGWeight"/>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
	   </div>
   </xsl:template>
   <!-- Основной документ -->
   <xsl:template match="gcd:GoodsClassificationDecision">
      <div class="pagePortrait">
		  <xsl:if test="gcd:RegistryNumber/gcd:IDDoc='КР'">
			<table>
				<tbody>
				   <tr>
					  <td colspan="6" style="text-align:center;font-size:10pt;border:0px;border-bottom:1px solid black;">
						  <b>
						  Решение<br/>по классификации товара в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
							<xsl:choose>
								<xsl:when test="gcd:GoodsDirection='ИМ'">ввоз </xsl:when>
								<xsl:when test="gcd:GoodsDirection='ЭК'">вывоз </xsl:when>
								<xsl:otherwise>ввоз или вывоз </xsl:otherwise>
							</xsl:choose>
						  которого предполагается различными товарными партиями в течение установленного периода времени
						  </b>
					  </td>
				   </tr>
				   <tr>
					  <td width="50%" colspan="3">
						 1. Наименование таможенного органа, принявшего решение по классификации товара<br/>
						 <xsl:value-of select="gcd:Customs/cat_ru:Code"/><xsl:text> </xsl:text><xsl:value-of select="gcd:Customs/cat_ru:OfficeName"/>
					  </td>
					  <td rowspan="2" colspan="3">
						 3. Сведения о заявителе<br/>
						 <xsl:apply-templates select="gcd:Declarant"/>
					  </td>
				   </tr>
				   <tr>
					  <td colspan="3">
						 2. Наименование таможенного органа, где будет осуществляться декларирование товара<br/>
						 <xsl:value-of select="gcd:CustomsDecl/cat_ru:Code"/><xsl:text> </xsl:text><xsl:value-of select="gcd:CustomsDecl/cat_ru:OfficeName"/>
					  </td>
				   </tr>
				   <tr>
					  <td colspan="3">
						4. Регистрационный номер<br/>
						<xsl:apply-templates select="gcd:RegistryNumber"/>
					  </td>
					  <td colspan="3">
						5. Дата принятия решения по классификации товара (число, месяц, год)<br/>
						<xsl:call-template name="date">
							<xsl:with-param name="text" select="gcd:RegistryNumber/gcd:Date"/>
						</xsl:call-template>
					  </td>
				   </tr>
				   <tr>
					  <td colspan="6">
					  6. Наименование товара<br/>
					  <xsl:if test="gcd:GoodsDescription">
						  <xsl:for-each select="gcd:GoodsDescription">
							  <xsl:value-of select="."/>
						  </xsl:for-each>
						  <br/>
					  </xsl:if>
					  <xsl:apply-templates select="gcd:GoodsInformation"/>
					  </td>
				   </tr>
				   <tr>
						<td colspan="2" width="33%">
							7. 10-значный классификационный код товара по ТН ВЭД ЕАЭС<br/>
							<xsl:value-of select="gcd:GoodsTNVED"/>
						</td>
						<td colspan="2" width="33%">
							8. Обоснование решения по классификации товара<br/>
							<xsl:value-of select="gcd:InterpretationRules"/>
						</td>
						<td colspan="2">
							9. Вид таможенной процедуры, под которую будет помещен товар<br/>
							<xsl:choose>
								<xsl:when test="gcd:CustomsModeCode='10'">Экспорт</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='21'">Переработка вне таможенной территории</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='23'">Временный вывоз</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='31'">Реэкспорт</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='40'">Выпуск для внутреннего потребления</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='51'">Переработка на таможенной территории</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='53'">Временный ввоз (допуск)</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='60'">Реимпорт</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='70'">Таможенный склад</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='77'">Свободный склад</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='78'">Свободная таможенная зона</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='80'">Таможенный транзит</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='90'">Специальная таможенная процедура</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='91'">Переработка для внутреннего потребления</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='93'">Уничтожение</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='94'">Отказ в пользу государства
</xsl:when>
								<xsl:when test="gcd:CustomsModeCode='96'">Беспошлинная торговля</xsl:when>
								<xsl:otherwise><xsl:value-of select="gcd:CustomsModeCode"/></xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					<tr>
						<td colspan="6">
						10. Реквизиты документов, которые подтверждают совершение внешнеэкономической сделки и в соответствии с которыми будет осуществляться 
						<xsl:choose>
							<xsl:when test="gcd:GoodsDirection='ИМ'">ввоз </xsl:when>
							<xsl:when test="gcd:GoodsDirection='ЭК'">вывоз </xsl:when>
							<xsl:otherwise>ввоз или вывоз </xsl:otherwise>
						</xsl:choose>
						компонентов товара<br/>
						<xsl:apply-templates select="gcd:Documents"/>
						<xsl:if test="gcd:GoodsDirection='ИМ' and (gcd:StartDelivery or gcd:TermOfDelivery)">
							<br/>
							<xsl:if test="gcd:StartDelivery">
								начало поставки товара:
								<xsl:call-template name="dateRussian">
									<xsl:with-param name="text" select="gcd:StartDelivery"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="gcd:TermOfDelivery">
								<xsl:if test="gcd:StartDelivery">; </xsl:if>
								окончание поставки товара:
								<xsl:call-template name="dateRussian">
									<xsl:with-param name="text" select="gcd:TermOfDelivery"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							11. Приложение (перечень компонентов товара)<br/>
							На 
							<xsl:choose>
								<xsl:when test="gcd:ComponentListPages"><u> <xsl:value-of select="gcd:ComponentListPages"/> </u></xsl:when>
								<xsl:otherwise><u> <xsl:text>&#160;&#160;&#160;&#160;</xsl:text> </u></xsl:otherwise>
							</xsl:choose>
							<xsl:text> л.   в </xsl:text>
							<xsl:choose>
								<xsl:when test="gcd:ComponentListCopies"><u> <xsl:value-of select="gcd:ComponentListCopies"/> </u></xsl:when>
								<xsl:otherwise><u> <xsl:text>&#160;&#160;&#160;&#160;</xsl:text> </u></xsl:otherwise>
							</xsl:choose>
							<xsl:text> экз.</xsl:text>
							<br/>
						</td>
					</tr>
				   <tr>
					  <td colspan="6">
						 12. Должностное лицо таможенного органа, принявшее решение по классификации товара
						 <xsl:apply-templates select="gcd:CustomsPerson"/>
					  </td>
				   </tr>
				</tbody>
			 </table>
		  </xsl:if>
		  <xsl:if test="gcd:RegistryNumber/gcd:IDDoc='ОЗ'">
			<table>
				<tbody>
				   <tr>
					  <td colspan="2" style="text-align:center;font-size:10pt;border:0px;border-bottom:1px solid black;">
						  <b>
						  Решение<br/>об отказе в рассмотрении заявления о принятии решения по классификации товара в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
							<xsl:choose>
								<xsl:when test="gcd:GoodsDirection='ИМ'">ввоз </xsl:when>
								<xsl:when test="gcd:GoodsDirection='ЭК'">вывоз </xsl:when>
								<xsl:otherwise>ввоз или вывоз </xsl:otherwise>
							</xsl:choose>
						  которого предполагается различными товарными партиями в течение установленного периода времени<br/>
						  </b>
					  </td>
				   </tr>
				   <tr>
					  <td width="50%">
						 1. Наименование таможенного органа, принявшего решение об отказе в рассмотрении заявления о принятии решения по классификации<br/>
						 <xsl:value-of select="gcd:Customs/cat_ru:Code"/><xsl:text> </xsl:text><xsl:value-of select="gcd:Customs/cat_ru:OfficeName"/>
					  </td>
					  <td>
						 2. Сведения о заявителе<br/>
						 <xsl:apply-templates select="gcd:Declarant"/>
					  </td>
				   </tr>
				   <tr>
					  <td>
						 3. Регистрационный номер решения об отказе в рассмотрении заявления о принятии решения по классификации<br/>
						 <xsl:apply-templates select="gcd:RegistryNumber"/>
					  </td>
					  <td>
						 4. Дата принятия решения об отказе в рассмотрении заявления о принятии решения по классификации (число, месяц, год)<br/>
							<xsl:call-template name="date">
								<xsl:with-param name="text" select="gcd:RegistryNumber/gcd:Date"/>
							</xsl:call-template>
					  </td>
				   </tr>
				   <tr>
					  <td>
						5. Исходящий номер заявления о принятии решения по классификации<br/>
						<xsl:value-of select="gcd:ApplicationRegistration/cat_ru:PrDocumentNumber"/>
					  </td>
					  <td>
						6. Дата исходящего заявления о принятии решения по классификации (число, месяц, год)<br/>
						<xsl:call-template name="date">
							<xsl:with-param name="text" select="gcd:ApplicationRegistration/cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					  </td>
				   </tr>
				   <tr>
					  <td colspan="2">
					  7. Наименование товара, указанного в заявлении о принятии решения по классификации<br/>
					  <xsl:if test="gcd:GoodsDescription">
						  <xsl:for-each select="gcd:GoodsDescription">
							  <xsl:value-of select="."/>
						  </xsl:for-each>
						  <br/>
					  </xsl:if>
					  <xsl:apply-templates select="gcd:GoodsInformation"/>
					  </td>
				   </tr>
				   <tr>
						<td colspan="2">
							8. Основание принятия решения об отказе в рассмотрении заявления о принятии решения по классификации<br/>
							<xsl:value-of select="gcd:InterpretationRules"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							9. Причины принятия решения об отказе в рассмотрении заявления о принятии решения по классификации<br/>
							<xsl:for-each select="gcd:ReasonsForDecision">
								9.<xsl:value-of select="position()"/><xsl:text> </xsl:text><xsl:value-of select="gcd:Number"/><xsl:text> </xsl:text><xsl:value-of select="gcd:Text"/>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							10. Должностное лицо таможенного органа, принявшее решение об отказе в рассмотрении заявления
							<xsl:apply-templates select="gcd:CustomsPerson"/>
						</td>
					</tr>
				</tbody>
			 </table>
		  </xsl:if>
		  <xsl:if test="gcd:RegistryNumber/gcd:IDDoc='ОЕ'">
			<table>
				<tbody>
				   <tr>
					  <td colspan="2" style="text-align:center;font-size:10pt;border:0px;border-bottom:1px solid black;">
						  <b>
						  Решение<br/>об отклонении заявления о принятии решения по классификации товара в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
							<xsl:choose>
								<xsl:when test="gcd:GoodsDirection='ИМ'">ввоз </xsl:when>
								<xsl:when test="gcd:GoodsDirection='ЭК'">вывоз </xsl:when>
								<xsl:otherwise>ввоз или вывоз </xsl:otherwise>
							</xsl:choose>
						  которого предполагается различными товарными партиями в течение установленного периода времени<br/>
						  </b>
					  </td>
				   </tr>
				   <tr>
					  <td width="50%">
						 1. Наименование таможенного органа, принявшего решение об отклонении заявления о принятии решения по классификации<br/>
						 <xsl:value-of select="gcd:Customs/cat_ru:Code"/><xsl:text> </xsl:text><xsl:value-of select="gcd:Customs/cat_ru:OfficeName"/>
					  </td>
					  <td>
						 2. Сведения о заявителе<br/>
						 <xsl:apply-templates select="gcd:Declarant"/>
					  </td>
				   </tr>
				   <tr>
					  <td>
						 3. Регистрационный номер решения об отклонении заявления о принятии решения по классификации<br/>
						 <xsl:apply-templates select="gcd:RegistryNumber"/>
					  </td>
					  <td>
						 4. Дата принятия решения об отклонении заявления о принятии решения по классификации (число, месяц, год)<br/>
							<xsl:call-template name="date">
								<xsl:with-param name="text" select="gcd:RegistryNumber/gcd:Date"/>
							</xsl:call-template>
					  </td>
				   </tr>
				   <tr>
					  <td>
						5. Исходящий номер заявления о принятии решения по классификации<br/>
						<xsl:value-of select="gcd:ApplicationRegistration/cat_ru:PrDocumentNumber"/>
					  </td>
					  <td>
						6. Дата исходящего заявления о принятии решения по классификации (число, месяц, год)<br/>
						<xsl:call-template name="date">
							<xsl:with-param name="text" select="gcd:ApplicationRegistration/cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					  </td>
				   </tr>
				   <tr>
					  <td colspan="2">
					  7. Наименование товара, указанного в заявлении о принятии решения по классификации<br/>
					  <xsl:if test="gcd:GoodsDescription">
						  <xsl:for-each select="gcd:GoodsDescription">
							  <xsl:value-of select="."/>
						  </xsl:for-each>
						  <br/>
					  </xsl:if>
					  <xsl:apply-templates select="gcd:GoodsInformation"/>
					  </td>
				   </tr>
				   <tr>
						<td colspan="2">
							8. Основание принятия решения об отклонении заявления о принятии решения по классификации<br/>
							<xsl:value-of select="gcd:InterpretationRules"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							9. Причины принятия решения об отказе в рассмотрении заявления о принятии решения по классификации<br/>
							<xsl:for-each select="gcd:ReasonsForDecision">
								9.<xsl:value-of select="gcd:Number"/><xsl:text> </xsl:text><xsl:value-of select="gcd:Text"/>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							10. Должностное лицо таможенного органа, принявшее решение об отклонении заявления о принятии решения по классификации
							<xsl:apply-templates select="gcd:CustomsPerson"/>
						</td>
					</tr>
				</tbody>
			 </table>
		  </xsl:if>
		  <xsl:if test="gcd:RegistryNumber/gcd:IDDoc='ИЗ'">
			<table>
				<tbody>
				   <tr>
					  <td colspan="6" style="text-align:center;font-size:10pt;border:0px;border-bottom:1px solid black;">
						  <b>
						  Решение<br/>о внесении изменений в решение по классификации товара в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
							<xsl:choose>
								<xsl:when test="gcd:GoodsDirection='ИМ'">ввоз </xsl:when>
								<xsl:when test="gcd:GoodsDirection='ЭК'">вывоз </xsl:when>
								<xsl:otherwise>ввоз или вывоз </xsl:otherwise>
							</xsl:choose>
						  которого предполагается различными товарными партиями в течение установленного периода времени
						  </b>
					  </td>
				   </tr>
				   <tr>
					  <td width="50%" colspan="3">
						 1. Наименование таможенного органа, принявшего решение о внесении изменений в решение по классификации товара<br/>
						 <xsl:value-of select="gcd:Customs/cat_ru:Code"/><xsl:text> </xsl:text><xsl:value-of select="gcd:Customs/cat_ru:OfficeName"/>
					  </td>
					  <td colspan="3">
						 2. Сведения о заявителе<br/>
						 <xsl:apply-templates select="gcd:Declarant"/>
					  </td>
				   </tr>
				   <tr>
					  <td colspan="3">
						 3. Регистрационный номер решения о внесении изменений в решение по классификации товара<br/>
						 <xsl:apply-templates select="gcd:RegistryNumber"/>
					  </td>
					  <td colspan="3">
						 4. Дата принятия решения о внесении изменений в решение по классификации товара (число, месяц, год)<br/>
						<xsl:call-template name="date">
							<xsl:with-param name="text" select="gcd:RegistryNumber/gcd:Date"/>
						</xsl:call-template>
					  </td>
				   </tr>
				   <tr>
					  <td colspan="3">
						5. Регистрационный номер решения по классификации товара, в которое вносятся изменения<br/>
						<xsl:apply-templates select="gcd:PrecedingDecisionRegNumber"/>
					  </td>
					  <td colspan="3">
						6. Дата принятия решения по классификации товара, в которое вносятся изменения (число, месяц, год)<br/>
						<xsl:call-template name="date"><xsl:with-param name="text" select="gcd:PrecedingDecisionRegNumber/gcd:Date"/></xsl:call-template>
					  </td>
				   </tr>
				   <tr>
					   <td colspan="6" style="padding:0;">
						   <table style="margin:0;border:0;">
								<tbody>
									<tr>
										<td width="33%" style="border:0px solid white;border-right:1px solid black;">
											7. Номер графы решения по классификации товара
										</td>
										<td width="33%" style="border:0px solid white;border-right:1px solid black;">
											8. Сведения, указанные в изменяемой графе решения по классификации товара
										</td>
										<td width="34%" style="border:0px solid white;">
											9. Измененная редакция графы решения по классификации товара
										</td>
									</tr>
									<xsl:for-each select="gcd:ModificationContent">
										<tr>
											<td width="33%" style="border:0px solid white;border-right:1px solid black;">
												7.<xsl:value-of select="position()"/><xsl:text> </xsl:text><xsl:value-of select="gcd:IDGrafa"/>
											</td>
											<td width="33%" style="border:0px solid white;border-right:1px solid black;">
												8.<xsl:value-of select="position()"/><xsl:text> </xsl:text><xsl:value-of select="gcd:Original"/>
											</td>
											<td width="34%" style="border:0px solid white;">
												9.<xsl:value-of select="position()"/><xsl:text> </xsl:text><xsl:value-of select="gcd:Modification"/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="6">
						10. Основания внесения изменений в решение по классификации товара<br/>
						<xsl:value-of select="gcd:InterpretationRules"/>
						</td>
					</tr>
					<tr>
						<td colspan="6">
						11. Причины внесения изменений в решение по классификации товара<br/>
						<xsl:for-each select="gcd:ReasonsForDecision">
							11.<xsl:value-of select="gcd:Number"/><xsl:text> </xsl:text><xsl:value-of select="gcd:Text"/>
							<xsl:if test="position()!=last()"><br/></xsl:if>
						</xsl:for-each>
						</td>
					</tr>
					<tr>
						<td colspan="6">
						12. Приложение к решению о внесении изменений в приложение к решению по классификации товара (перечень компонентов товара)<br/>
							<xsl:if test="gcd:ComponentListPages">
								На <u> <xsl:value-of select="gcd:ComponentListPages"/> </u> л.
							</xsl:if>
							<xsl:if test="gcd:ComponentListCopies">
								<xsl:text> в </xsl:text><u> <xsl:value-of select="gcd:ComponentListCopies"/> </u> экз.<br/>
							</xsl:if>
							<xsl:for-each select="gcd:TypeChange">
								<xsl:value-of select="."/>
							</xsl:for-each>
						</td>
					</tr>
					<tr>
						<td colspan="6">
						13. Срок вступления в силу решения о внесении изменений в решение по классификации товара<br/>
						<xsl:call-template name="date"><xsl:with-param name="text" select="gcd:DateEntryIntoForce"/></xsl:call-template>
						</td>
					</tr>
				   <tr>
					  <td colspan="6">
						 14. Должностное лицо таможенного органа, принявшее решение о внесении изменений в решение по классификации товара
						 <xsl:apply-templates select="gcd:CustomsPerson"/>
					  </td>
				   </tr>
				</tbody>
			 </table>
		  </xsl:if>
		  <xsl:if test="gcd:RegistryNumber/gcd:IDDoc='ОИ'">
			<table>
				<tbody>
				   <tr>
					  <td colspan="2" style="text-align:center;font-size:10pt;border:0px;border-bottom:1px solid black;">
						  <b>
						  Решение<br/>об отклонении заявления о внесении изменений в решение по классификации товара в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
							<xsl:choose>
								<xsl:when test="gcd:GoodsDirection='ИМ'">ввоз </xsl:when>
								<xsl:when test="gcd:GoodsDirection='ЭК'">вывоз </xsl:when>
								<xsl:otherwise>ввоз или вывоз </xsl:otherwise>
							</xsl:choose>
						  которого предполагается различными товарными партиями в течение установленного периода времени
						  <br/>
						  </b>
					  </td>
				   </tr>
				   <tr>
					  <td width="50%">
						 1. Наименование таможенного органа, принявшего решение об отклонении заявления о внесении изменений в решение по классификации<br/>
						 <xsl:value-of select="gcd:Customs/cat_ru:Code"/><xsl:text> </xsl:text><xsl:value-of select="gcd:Customs/cat_ru:OfficeName"/>
					  </td>
					  <td>
						 2. Сведения о заявителе<br/>
						 <xsl:apply-templates select="gcd:Declarant"/>
					  </td>
				   </tr>
				   <tr>
					  <td>
						 3. Регистрационный номер решения об отклонении заявления о внесении изменений в решение по классификации<br/>
						 <xsl:apply-templates select="gcd:RegistryNumber"/>
					  </td>
					  <td>
						 4. Дата принятия решения об отклонении заявления о внесении изменений в решение по классификации (число, месяц, год)<br/>
							<xsl:call-template name="date">
								<xsl:with-param name="text" select="gcd:RegistryNumber/gcd:Date"/>
							</xsl:call-template>
					  </td>
				   </tr>
				   <tr>
					  <td>
						5. Исходящий номер заявления о внесении изменений в решение по классификации<br/>
						<xsl:value-of select="gcd:ApplicationRegistration/cat_ru:PrDocumentNumber"/>
					  </td>
					  <td>
						6. Дата исходящего заявления о внесении изменений в решение по классификации (число, месяц, год)<br/>
						<xsl:call-template name="date">
							<xsl:with-param name="text" select="gcd:ApplicationRegistration/cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					  </td>
				   </tr>
				   <tr>
						<td>
							7. Регистрационный номер решения по классификации товара<br/>
							<xsl:apply-templates select="gcd:PrecedingDecisionRegNumber"/>
						</td>
						<td>
							8. Дата принятия решения по классификации товара (число, месяц, год)<br/>
							<xsl:call-template name="date"><xsl:with-param name="text" select="gcd:PrecedingDecisionRegNumber/gcd:Date"/></xsl:call-template>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							9. Основание принятия решение об отклонении заявления о внесении изменений в решение по классификации<br/>
							<xsl:value-of select="gcd:InterpretationRules"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							10. Причины принятия решения об отклонении заявления о внесении изменений в решение по классификации<br/>
							<xsl:for-each select="gcd:ReasonsForDecision">
								<xsl:value-of select="gcd:Text"/>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							11. Должностное лицо таможенного органа, принявшее решение об отклонении заявления о внесении изменений в решение по классификации товара
							<xsl:apply-templates select="gcd:CustomsPerson"/>
						</td>
					</tr>
				</tbody>
			 </table>
		  </xsl:if>
		  <xsl:if test="gcd:RegistryNumber/gcd:IDDoc='ПД'">
			<table>
				<tbody>
				   <tr>
					  <td colspan="2" style="text-align:center;font-size:10pt;border:0px;border-bottom:1px solid black;">
						  <b>
						  Решение<br/>о прекращении действия решения по классификации товара в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
							<xsl:choose>
								<xsl:when test="gcd:GoodsDirection='ИМ'">ввоз </xsl:when>
								<xsl:when test="gcd:GoodsDirection='ЭК'">вывоз </xsl:when>
								<xsl:otherwise>ввоз или вывоз </xsl:otherwise>
							</xsl:choose>
						  которого предполагается различными товарными партиями в течение установленного периода времени
							<br/>
						  </b>
					  </td>
				   </tr>
				   <tr>
					  <td width="50%">
						 1. Наименование таможенного органа, принявшего решение о прекращении действия решения по классификации товара<br/>
						 <xsl:value-of select="gcd:Customs/cat_ru:Code"/><xsl:text> </xsl:text><xsl:value-of select="gcd:Customs/cat_ru:OfficeName"/>
					  </td>
					  <td>
						 2. Сведения о заявителе<br/>
						 <xsl:apply-templates select="gcd:Declarant"/>
					  </td>
				   </tr>
				   <tr>
					  <td>
						 3. Регистрационный номер решения о прекращении действия решения по классификации товара<br/>
						 <xsl:apply-templates select="gcd:RegistryNumber"/>
					  </td>
					  <td>
						 4. Дата принятия решения о прекращении действия решения по классификации товара (число, месяц, год)<br/>
							<xsl:call-template name="date">
								<xsl:with-param name="text" select="gcd:RegistryNumber/gcd:Date"/>
							</xsl:call-template>
					  </td>
				   </tr>
				   <tr>
					  <td>
						5. Регистрационный номер решения по классификации товара, действие которого прекращается<br/>
						<xsl:apply-templates select="gcd:PrecedingDecisionRegNumber"/>
					  </td>
					  <td>
						6. Дата принятия решения по классификации товара, действие которого прекращается (число, месяц, год)<br/>
						<xsl:call-template name="date">
							<xsl:with-param name="text" select="gcd:PrecedingDecisionRegNumber/gcd:Date"/>
						</xsl:call-template>
					  </td>
				   </tr>
				   <tr>
					  <td colspan="2">
					  7. Наименование товара, указанное в решении по классификации товара<br/>
					  <xsl:if test="gcd:GoodsDescription">
						  <xsl:for-each select="gcd:GoodsDescription">
							  <xsl:value-of select="."/>
						  </xsl:for-each>
						  <br/>
					  </xsl:if>
					  <xsl:apply-templates select="gcd:GoodsInformation"/>
					  </td>
				   </tr>
				   <tr>
						<td colspan="2">
							8. Основание принятия решения о прекращении действия решения по классификации товара<br/>
							<xsl:value-of select="gcd:InterpretationRules"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							9. Причины принятия решения о прекращении действия решения по классификации товара<br/>
							<xsl:for-each select="gcd:ReasonsForDecision">
								9.<xsl:value-of select="gcd:Number"/><xsl:text> </xsl:text><xsl:value-of select="gcd:Text"/>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							10. Срок вступления в силу решения о прекращении действия решения по классификации товара<br/>
							<xsl:call-template name="date"><xsl:with-param name="text" select="gcd:DateEntryIntoForce"/></xsl:call-template>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							11. Должностное лицо таможенного органа, принявшее решение о прекращении действия решения по классификации товара
							<xsl:apply-templates select="gcd:CustomsPerson"/>
						</td>
					</tr>
				</tbody>
			 </table>
		  </xsl:if>
      </div>
      <xsl:if test="gcd:RegistryNumber/gcd:IDDoc='КР' or gcd:RegistryNumber/gcd:IDDoc='ИЗ'">
		  <xsl:call-template name="application"/>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>

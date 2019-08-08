<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cm="urn:customs.ru:Information:CommercialFinanceDocuments:CashMemorandum:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Сведения из товарного и кассового чеков</title>
            <style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                    }

                    div.page {
                        width: 297mm;
                        margin-top: 10pt;
                        margin-bottom: 10pt;
                        margin-left: auto;
                        margin-right: auto;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                        text-align: left;
                    }

                    table.items {
                        border: none;
                        border-collapse: collapse;
                        emptyCells: show;
                        font-family: Arial;
                        font-size: 8pt;
                        page-break-inside: avoid;
                    }

                    .items th {
                        background: #F0F0F0;
                        font-weight: bold;
                        border: solid 1px black;
                        padding: 3px;
                        vertical-align: top;
                    }

                    .items td {
                        border: solid 1px black;
                        padding: 3px;
                        vertical-align: top;
                        text-align: right;
                    }

                    h2 {
                        text-align: center;
                    }

                    h3 {
                        text-align: center;
                    }

                    h4 {
                        text-align: center;
                    }

                    table {
                        border: none;
                        vertical-align: top;
                    }

                    td {
                        vertical-align: top;
                    }

                    td.graphUnderline {
                        border-bottom: 1px solid black;
                        text-align: center;
                        white-space: nowrap;
                    }

                    td.graph {
                        font-size: 8pt;
                        text-align: center;
                        padding: 0;
                        spacing: 0;
                        white-space: nowrap;
                    }

                    span {
                        font-weight: bold;
                    }

                    span:before {
                        content: " ";
                    }

                    @media print {
                        div.page {
                            border: none;
                        }
                    }
                </style>
         </head>
         <body>
            <xsl:apply-templates/>
         </body>
      </html>
   </xsl:template>
   <!--Обработка корневого элемента-->
   <xsl:template match="cm:CashMemorandum">
      <div class="page">
         <h3>Сведения из товарного и кассового чеков</h3>
         <table style="width: 100%;">
            <tr>
               <td class="graphUnderline">
                  <xsl:value-of select="cm:Number"/>
               </td>
               <td style="width: 100%;"/>
               <td class="graphUnderline">
                  <xsl:apply-templates select="cm:CashPayment"/>
               </td>
            </tr>
            <tr>
               <td class="graph">Номер чека</td>
               <td/>
               <td class="graph">Расчет</td>
            </tr>
            <tr>
               <td class="graphUnderline">
                  <xsl:apply-templates select="cm:CreateDateTime"/>
               </td>
               <td/>
               <td class="graphUnderline">
                  <xsl:value-of select="cm:CurrencyCode"/>
               </td>
            </tr>
            <tr>
               <td class="graph">Дата и время составления чека</td>
               <td/>
               <td class="graph">Валюта</td>
            </tr>
            <tr>
               <td class="graphUnderline">
                  <xsl:value-of select="cm:CashDeskNumber"/>
               </td>
               <td/>
               <td class="graphUnderline">
                  <xsl:value-of select="cm:Sum"/>
               </td>
            </tr>
            <tr>
               <td class="graph">№ кассы</td>
               <td/>
               <td class="graph">Общая сумма</td>
            </tr>
            <tr>
               <td/>
               <td/>
               <td class="graphUnderline">
                  <xsl:value-of select="cm:Change"/>
               </td>
            </tr>
            <tr>
               <td/>
               <td/>
               <td class="graph">Сдача</td>
            </tr>
         </table>
         <h4>Информация о продавце</h4>
         <xsl:apply-templates select="cm:Seller"/>
         <h4>Информация о покупателе</h4>
         <xsl:apply-templates select="cm:Customer"/>
         <h4>Информация о товарах</h4>
         <xsl:apply-templates select="cm:Goods"/>
         <table style="width: 100%;">
            <tr>
               <td class="graphUnderline" width="46%">
                  <xsl:call-template name="signature">
                     <xsl:with-param name="base" select="cm:CustomerSignature"/>
                  </xsl:call-template>
               </td>
               <td width="8%"/>
               <td class="graphUnderline" width="46%">
                  <xsl:call-template name="signature">
                     <xsl:with-param name="base" select="cm:SellerSignature"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td class="graph">Покупатель</td>
               <td/>
               <td class="graph">Кассир</td>
            </tr>
            <tr>
               <td class="graphUnderline">
                  <xsl:call-template name="Date">
                     <xsl:with-param name="text" select="cm:CustomerSignature/cat_ru:IssueDate"/>
                  </xsl:call-template>
               </td>
               <td/>
               <td class="graphUnderline">
                  <xsl:call-template name="Date">
                     <xsl:with-param name="text" select="cm:SellerSignature/cat_ru:IssueDate"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td class="graph">Дата</td>
               <td/>
               <td class="graph">Дата</td>
            </tr>
         </table>
      </div>
   </xsl:template>
   <xsl:template name="DateForCustomsNumber">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text,5,1)='-' and substring($text,8,1)='-'">
            <xsl:value-of select="substring($text,9,2)"/>
            <xsl:value-of select="substring($text,6,2)"/>
            <xsl:value-of select="substring($text,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="Date">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
            <xsl:value-of select="substring($text,9,2)"/>.<xsl:value-of select="substring($text,6,2)"/>.<xsl:value-of select="substring($text,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--Данные о продавце -->
   <xsl:template match="cm:Seller">
      <table style="width: 100%;">
         <xsl:apply-templates select="cm:Organisation"/>
         <xsl:apply-templates select="cm:Address"/>
      </table>
   </xsl:template>
   <!--Данные о покупателе -->
   <xsl:template match="cm:Customer">
      <table style="width: 100%;">
         <tr>
            <td class="graphUnderline">
               <xsl:value-of select="."/>
            </td>
         </tr>
         <tr>
            <td class="graph">Наименование организации</td>
         </tr>
      </table>
   </xsl:template>
   <!-- Организация -->
   <xsl:template match="cm:Organisation">
      <tr>
         <td class="graphUnderline">
            <xsl:value-of select="cat_ru:OrganizationName"/>
            <xsl:if test="cat_ru:ShortName">
               <xsl:text> (</xsl:text>
               <xsl:value-of select="cat_ru:ShortName"/>
               <xsl:text>) </xsl:text>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td class="graph">Наименование организации</td>
      </tr>
      <tr>
         <td class="graphUnderline">
            <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
               <span>ОГРН/ОГРНИП:</span>
               <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
            </xsl:if>
            <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
               <span>ИНН:</span>
               <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
            </xsl:if>
            <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
               <span>КПП:</span>
               <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td class="graph">Реквизиты</td>
      </tr>
   </xsl:template>
   <!--Адрес в виде строки-->
   <xsl:template match="cm:Address">
      <tr>
         <td class="graphUnderline">
            <xsl:for-each select="*">
               <xsl:if test="position() > 1">
                  <xsl:text>, </xsl:text>
               </xsl:if>
               <xsl:value-of select="."/>
            </xsl:for-each>
         </td>
      </tr>
      <tr>
         <td class="graph">Адрес</td>
      </tr>
   </xsl:template>
   <!--Подпись-->
   <xsl:template name="signature">
      <xsl:param name="base"/>
      <xsl:value-of select="$base/cat_ru:PersonSurname"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
      <xsl:value-of select="$base/cat_ru:PersonName"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
      <xsl:value-of select="$base/cat_ru:PersonMiddleName"/>
      <xsl:if test="$base/cat_ru:PersonPost">
         <xsl:text>, </xsl:text>
         <xsl:value-of select="$base/cat_ru:PersonPost"/>
      </xsl:if>
      <xsl:text>. </xsl:text>
   </xsl:template>
   <!-- Товары -->
   <xsl:template match="cm:Goods">
      <table class="items">
         <tr>
            <th>Номер товара в списке</th>
            <th>Описание товара</th>
            <th>Название единицы измерения</th>
            <th>Код единицы измерения</th>
            <th>Количество товара в единицах измерения</th>
            <th>Цена товара</th>
            <th>Стоимость товара</th>
         </tr>
         <tr>
            <td>
               <xsl:value-of select="cm:Number"/>
            </td>
            <td>
               <xsl:value-of select="catComFin_ru:GoodsDescription"/>
            </td>
            <td>
               <xsl:value-of select="catComFin_ru:MeasureUnitQualifierName"/>
            </td>
            <td>
               <xsl:value-of select="catComFin_ru:MeasureUnitQualifierCode"/>
            </td>
            <td>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="catComFin_ru:GoodsQuantity"/>
            </td>
            <td>
               <xsl:value-of select="catComFin_ru:Price"/>
            </td>
            <td>
               <xsl:value-of select="catComFin_ru:GCost"/>
            </td>
         </tr>
         <tr>
            <th>Вес товара нетто (кг)</th>
            <th>Вес товара брутто (кг)</th>
            <th>Общее количество грузовых мест товара</th>
            <th>Вес места (кг)</th>
            <th>Код товара по ТН ВЭД ЕАЭС</th>
            <th>Код валюты контракта (цены)</th>
            <th>Артикул товара</th>
         </tr>
         <tr>
            <td>
               <xsl:value-of select="catComFin_ru:GoodsWeight/catComFin_ru:NetWeightQuantity"/>
            </td>
            <td>
               <xsl:value-of select="catComFin_ru:GoodsWeight/catComFin_ru:GrossWeightQuantity"/>
            </td>
            <td>
               <xsl:value-of select="catComFin_ru:GoodsPlace/catComFin_ru:PlacesQuantity"/>
            </td>
            <td>
               <xsl:value-of select="catComFin_ru:GoodsPlace/catComFin_ru:PlaceWeightQuantity"/>
            </td>
            <td>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="catComFin_ru:GoodsTNVEDCode"/>
            </td>
            <td>
               <xsl:value-of select="catComFin_ru:CurrencyCode"/>
            </td>
            <td>
               <xsl:value-of select="catComFin_ru:GoodMarking"/>
            </td>
         </tr>
         <tr>
            <th>Скидка, в процентах</th>
            <th>Налог, в процентах от стоимости товара</th>
            <th colspan="5">Дополнительная информация</th>
         </tr>
         <tr>
            <td>
               <xsl:value-of select="cm:Discount"/>
            </td>
            <td>
               <xsl:value-of select="cm:TaxPercent"/>
            </td>
            <td colspan="5">
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="cm:Notes"/>
            </td>
         </tr>
      </table>
      <br/>
   </xsl:template>
   <!-- тип расчета -->
   <xsl:template match="cm:CashPayment">
      <xsl:choose>
         <xsl:when test=". = 0">безналичный</xsl:when>
         <xsl:otherwise>наличный</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- Дата и время -->
   <xsl:template match="cm:CreateDateTime">
      <xsl:call-template name="Date">
         <xsl:with-param name="text" select="substring(.,1,10)"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring(.,12,5)"/>
   </xsl:template>
   <!--Отображает 0, если число не указано-->
   <xsl:template name="quantity">
      <xsl:param name="base"/>
      <xsl:choose>
         <xsl:when test="$base">
            <xsl:value-of select="$base"/>
         </xsl:when>
         <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>

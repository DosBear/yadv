<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.13.1" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cwd="urn:customs.ru:Information:WarehouseDocuments:CWDeclaration:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Заявление на проведение операций над товарами </title>
            <style type="text/css">
                    body {background-color: #cccccc;}

                    div.page {
                        width: 210mm;
                        margin: 6pt auto;
                        padding: 10mm;
                        background: white;
                        border: solid 1px black;
                    }

                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}

                    h1 {
                        text-align: center;
                        font-size: 16pt;
                        margin-bottom: 10pt;
                    }

                    h2 {
                        font-size: 14pt;
                        text-align: center;
                        margin-top: 20pt;
                    }

                    h3 {
                        font-size: 12pt;
                        margin: 0;
                    }

                    span {font-weight: bold;}

                    p {padding-left: 10pt;}

                    table {
                        border-collapse: collapse;
                    }

                    th {
                        border: 1px solid black;
                        background: #F0F0F0;
                        padding: 3px;
                    }

                    td {
                        border: 1px solid black;
                        padding: 3px;
                        vertical-align: top;
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <xsl:apply-templates select="cwd:CWDeclaration"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <!--Основной шаблон. Обрабатываем корневой элемент-->
   <xsl:template match="cwd:CWDeclaration">
      <h1>Заявление на проведение операций над товарами</h1>
      <xsl:apply-templates select="cwd:Header"/>
      <xsl:call-template name="Commodities"/>
   </xsl:template>
   <xsl:template match="cwd:Header">
      <p>
         <span>Наименование лица, обладающего правами в отношении товаров: </span>
         <xsl:apply-templates select="cwd:OwnerName"/>
         <xsl:if test="cwd:OwnerNameFull">
            <br/>
            <span>Полное наименование лица, обладающего правами в отношении товаров: </span>
            <xsl:apply-templates select="cwd:OwnerNameFull"/>
         </xsl:if>
         <br/>
         <span>Наименование таможенного органа, осуществляющего хранение товаров: </span>
         <xsl:apply-templates select="cwd:CustomName"/>
         <br/>
         <span>Порядковый номер редакции электронного документа: </span>
         <xsl:apply-templates select="cwd:OrderNumberOfEdition"/>
         <xsl:if test="cwd:PeriodStart | cwd:PeriodFinish">
            <br/>
            <span>Срок проведения операции.</span>
            <xsl:if test="cwd:PeriodStart">
               <span> Начало: </span>
               <xsl:call-template name="DateRu"><xsl:with-param name="text" select="cwd:PeriodStart"/></xsl:call-template>
            </xsl:if>
            <xsl:if test="cwd:PeriodStart">
               <span> Окончание: </span>
               <xsl:call-template name="DateRu"><xsl:with-param name="text" select="cwd:PeriodFinish"/></xsl:call-template>
            </xsl:if>
         </xsl:if>
         <xsl:if test="cwd:Materials">
            <br/>
            <span>Материалы, используемые при проведении операции: </span>
            <xsl:apply-templates select="cwd:Materials"/>
         </xsl:if>
         <xsl:if test="cwd:TechnicalFacilities">
            <br/>
            <span>Технические средства, используемые при проведении операции: </span>
            <xsl:apply-templates select="cwd:TechnicalFacilities"/>
         </xsl:if>
         <br/>
         <span>Операция над товарами.</span>
         <xsl:if test="cwd:OperationName">
            <span> Наименование: </span>
            <xsl:apply-templates select="cwd:OperationName"/>
            <xsl:text>.</xsl:text>
         </xsl:if>
         <span> Тип: </span>
         <xsl:apply-templates select="cwd:OperationID"/>
         <xsl:apply-templates select="cwd:DeclarationNumber"/>
         <xsl:apply-templates select="cwd:GTDNumber"/>
         <xsl:apply-templates select="cwd:StorageQuitanceNumber"/>
         <xsl:apply-templates select="cwd:FormularNumber"/>
      </p>
   </xsl:template>
   <xsl:template match="cwd:DeclarationNumber">
      <h3>Реквизиты заявления</h3>
      <xsl:call-template name="CustomsDocumentRequisites"/>
   </xsl:template>
   <xsl:template match="cwd:StorageQuitanceNumber">
      <h3>Реквизиты складской квитанции</h3>
      <xsl:call-template name="CustomsDocumentRequisites"/>
   </xsl:template>
   <xsl:template match="cwd:GTDNumber">
      <h3>Регистрационный номер ДТ, по которой товары помещены под таможенный режим таможенного склада</h3>
      <p>
         <xsl:apply-templates select="cat_ru:CustomsCode"/>
         <xsl:text>/</xsl:text>
         <xsl:apply-templates select="cat_ru:RegistrationDate"/>
         <xsl:text>/</xsl:text>
         <xsl:apply-templates select="cat_ru:GTDNumber"/>
      </p>   
   </xsl:template>
   <xsl:template match="cat_ru:RegistrationDate">
      <xsl:choose>
         <xsl:when test="substring(., 5, 1) = '-' and substring(., 8, 1) = '-'">
            <xsl:value-of select="substring(., 9, 2)"/>
            <xsl:value-of select="substring(., 6, 2)"/>
            <xsl:value-of select="substring(., 3, 2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="."/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cwd:FormularNumber">
      <h3>Реквизиты формуляра контроля товаров</h3>
      <xsl:call-template name="CustomsDocumentRequisites"/>
   </xsl:template>
	<!-- Шаблон для типа catWH_ru:AISTSDocumentIDType -->
   <xsl:template name="CustomsDocumentRequisites">
      <p>
         <span>Код таможенного органа: </span>
         <xsl:apply-templates select="catWH_ru:CustomsCode"/>
         <br/>
         <span>Дата оформления документа: </span>
         <xsl:call-template name="DateRu"><xsl:with-param name="text" select="catWH_ru:IssueDate"/></xsl:call-template>
         <br/>
         <span>Номер документа: </span>
         <xsl:apply-templates select="catWH_ru:DocNumber"/>
      </p>
   </xsl:template>
   
   <!--Таблица с товарами, перечисленными в заявлении-->
   <xsl:template name="Commodities">
      <h2>Товары</h2>
      <table>
         <tr>
            <th rowspan="2">№</th>
            <th rowspan="2">Описание</th>
            <th rowspan="2">Индивидуальные признаки</th>
            <th rowspan="2">Код<br/>ТН ВЭД</th>
            <th colspan="2">Вес, кг</th>
            <th colspan="2">Порядковый номер товара </th>
            <th colspan="3">Количество</th>
         </tr>
         <tr>
            <th>Брутто</th>
            <th>Нетто</th>
            <th>В складской квитанции, по которой товар помещен на склад</th>
            <th>В ДТ, по которой принят груз</th>
            <th>Код ед. изм.</th>
            <th>Ед. изм.</th>
            <th>Кол-во в ед. изм.</th>
         </tr>
         <xsl:apply-templates select="cwd:Commodity">
            <xsl:sort select="cat_ru:GoodsNumeric"/>
         </xsl:apply-templates>
      </table>
   </xsl:template>
   <xsl:template match="cwd:Commodity">
      <tr>
         <td><xsl:apply-templates select="cat_ru:GoodsNumeric"/></td>
         <td><xsl:apply-templates select="cat_ru:GoodsDescription"/></td>
         <td><xsl:apply-templates select="cwd:IndividualCharacteristics"/></td>
         <td><xsl:apply-templates select="cat_ru:GoodsTNVEDCode"/></td>
         <td><xsl:apply-templates select="cat_ru:GrossWeightQuantity"/></td>
         <td><xsl:apply-templates select="cat_ru:NetWeightQuantity"/></td>
         <td><xsl:apply-templates select="cwd:GoodsNumberInStorageQuitance"/></td>
         <td><xsl:apply-templates select="cwd:GoodsNumberInGTD"/></td>
         <td><xsl:apply-templates select="cwd:GoodsValue/catWH_ru:MeasureUnitQualifierCode"/></td>
         <td><xsl:apply-templates select="cwd:GoodsValue/catWH_ru:MeasureUnitQualifierName"/></td>
         <td><xsl:apply-templates select="cwd:GoodsValue/catWH_ru:GoodsQuantity"/></td>
      </tr>
   </xsl:template>
   <!--Дата по стандарту русской локали-->
   <xsl:template name="DateRu">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
            <!--Текст для разбора даты имеет верный формат - разбираем посимвольно-->
            <xsl:value-of select="substring($text, 9, 2)"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="substring($text, 6, 2)"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="substring($text, 1, 4)"/>
            <xsl:text> г.</xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <!--Текст для разбора даты имеет неверный формат - выводим текст в исходном виде-->
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>

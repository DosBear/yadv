<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gcrc="urn:customs.ru:Information:CustomsDocuments:GoodsCheckReport:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Отчёт о результатах сверки</title>
            <style type="text/css">
                    body{background: #cccccc}

                    div.pageAlbum {
                        /*width: 297mm;*/
                        margin: auto;
                        padding: 5mm;
                        background: white;
                        border: solid .5pt black;
                        text-align: left;
                    }

                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
                    @media print {
                        div.pageAlbum {border: none; margin: 0; padding: 0;}
                        @page {size: landscape;}
                    }

                    table.items {
                        border: none;
                        border-collapse: collapse;
                        emptyCells: show;
                        font-family: Arial;
                        font-size: 8pt;
                    }

                    .items th {
                        background: #F0F0F0;
                        vertical-align: middle;
                        font-weight: bold;
                    }

                    .items td, th {
                        border: solid 1px black;
                        padding: 3px;
                        vertical-align: top;
                    }

                    h1 {text-align: center}

                    h2 {text-align: center}

                    h3 {
                        text-align: left;
                        margin-top: 5pt;
                        margin-bottom: 5pt;
                    }

                    table {
                        border: none;
                        vertical-align: top;
                    }

                    td {vertical-align: top}

                    td.graphUnderline, td.items.graphUnderline {
						border : none;
                        border-bottom: 1px solid black;
                        text-align: center;
                    }

                    td.graph, td.items .graph {
						border : none;
                        font-size: 7pt;
                        text-align: center;
                        padding: 0;
                    }

                    p{text-indent: 20pt}
                    
                    .red{
						background-color: red;
                    }
				</style>
         </head>
         <body>
            <xsl:apply-templates select="gcrc:GoodsCheckReport"/>
         </body>
      </html>
   </xsl:template>
   <!-- Корневой элемент -->
   <xsl:template match="gcrc:GoodsCheckReport">
      <div class="pageAlbum">
         <h1>Отчёт о результатах сверки</h1>
         <div style="float: right;  max-width: 120mm; ">
            <xsl:apply-templates select="gcrc:Customs"/>
         </div>
         <div style="clear:both;  padding-top: 10pt; "/>
         <xsl:call-template name="AllCheckTables"/>
         <xsl:if test="gcrc:Note">
            <div style="padding-top : 10px;">
               <h3>Примечания, комментарии:</h3>
               <p>
                  <xsl:apply-templates select="gcrc:Note"/>
               </p>
            </div>
         </xsl:if>
         <div style="float: right; ">
            <xsl:apply-templates select="gcrc:CustomsPerson"/>
         </div>
         <div style="clear: both;"/>
      </div>
   </xsl:template>
   <xsl:template match="gcrc:Customs">
      <table>
         <tr>
            <td class="graphUnderline">
               <xsl:value-of select="cat_ru:Code"/>
            </td>
         </tr>
         <tr>
            <td class="graph">Код таможенного органа</td>
         </tr>
         <xsl:if test="cat_ru:OfficeName">
            <tr>
               <td class="graphUnderline">
                  <xsl:value-of select="cat_ru:OfficeName"/>
               </td>
            </tr>
            <tr>
               <td class="graph">Наименование таможенного органа</td>
            </tr>
         </xsl:if>
      </table>
   </xsl:template>
   <xsl:template name="AllCheckTables">
         <table class="items" style="width:297mm">
            <tr style="width:297mm">
				<td rowspan="2">Номер графы в декларации</td>
				<td rowspan="2">№ товара</td>
				<td rowspan="2">№ строки</td>
				<td rowspan="2">№ подстроки</td>
				<td rowspan="2">№ записи в графе</td>
				<td rowspan="2">Название атрибута информации в графе (номер, дата, марка и т.д.)</td>
				<td rowspan="2">Значение в декларации</td>
				<td rowspan="2">0-совпало, 1-не совпало</td>
				<td rowspan="2">Значение по документам</td>
				<td rowspan="2">Примечание инспектора, производящего проверку</td>
				<td colspan="4">Документ, содержащий сведения из ДТ</td>
				<td colspan="4">Документ, содержащий фактическое значение</td>
            </tr>
			<tr>
				<td style="width:30mm">Наименование</td>
				<td style="width:10mm">Номер</td>
				<td style="width:20mm">Дата</td>
				<td style="width:10mm">Код вида</td>
				<td style="width:30mm">Наименование</td>
				<td style="width:10mm">Номер</td>
				<td style="width:20mm">Дата</td>
				<td style="width:20mm">Сведения о штампах</td>
			</tr>
			<xsl:for-each select="gcrc:GoodsCheckTable">
				<xsl:sort select="gcrc:GTDGoodsNumber" data-type="number" order="ascending"/>
				<xsl:sort select="gcrc:ColumnNumber" data-type="number" order="ascending"/>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
         </table>
   </xsl:template>
   <!-- Элемент таблицы сверки -->
   <xsl:template match="gcrc:GoodsCheckTable">
	   <xsl:variable name="red">
		   <xsl:if test="gcrc:GTDValueFlag='1' or gcrc:GTDValueFlag='true'">red</xsl:if>
	   </xsl:variable>
      <tr>
		<td>
			<xsl:value-of select="gcrc:CheckElementLocation/gcrc:ColumnNumber"/>
		</td>
		<td>
			<xsl:value-of select="gcrc:CheckElementLocation/gcrc:GTDGoodsNumber"/>
		</td>
		<td>
			<xsl:value-of select="gcrc:CheckElementLocation/gcrc:LineNumber"/>
		</td>
		<td>
			<xsl:value-of select="gcrc:CheckElementLocation/gcrc:SubLineNumber"/>
		</td>
		<td>
			<xsl:value-of select="gcrc:CheckElementLocation/gcrc:RecordNumber"/>
		</td>
		<td>
			<xsl:value-of select="gcrc:CheckElementLocation/gcrc:FieldName"/>
		</td>
		<td>
			<xsl:value-of select="gcrc:GTDValue"/>
		</td>
		<td class="{$red}">
			<xsl:if test="gcrc:GTDValueFlag='1' or gcrc:GTDValueFlag='true'">1. нет</xsl:if>
			<xsl:if test="gcrc:GTDValueFlag='0' or gcrc:GTDValueFlag='false'">0. да</xsl:if>
		</td>
		<td>
			<xsl:value-of select="gcrc:TrueValue"/>
		</td>
		<td>
			<xsl:apply-templates select="gcrc:GTDValueNote"/>
		</td>
		<td>
			<xsl:value-of select="gcrc:TrueValueRefDocumentDT/cat_ru:PrDocumentName"/>
		</td>
		<td>
			<xsl:value-of select="gcrc:TrueValueRefDocumentDT/cat_ru:PrDocumentNumber"/>
		</td>
		<td>
			<xsl:call-template name="DateRu">
				<xsl:with-param name="text" select="gcrc:TrueValueRefDocumentDT/cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</td>
		<td>
			<xsl:value-of select="gcrc:TrueValueRefDocumentDT/gcrc:PresentedDocumentModeCode"/>
		</td>
		<td>
			<xsl:value-of select="gcrc:TrueValueRefDocument/cat_ru:PrDocumentName"/>
		</td>
		<td>
			<xsl:value-of select="gcrc:TrueValueRefDocument/cat_ru:PrDocumentNumber"/>
		</td>
		<td>
			<xsl:call-template name="DateRu">
				<xsl:with-param name="text" select="gcrc:TrueValueRefDocument/cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</td>
		<td>
			<xsl:for-each select="gcrc:TrueValueRefDocument/gcrc:Marks">
				<xsl:choose>
					<xsl:when test="gcrc:Value=0">Штамп отсутствует</xsl:when>
					<xsl:when test="gcrc:Value=1">Штамп есть <xsl:value-of select="gcrc:NameMarks"/></xsl:when>
				</xsl:choose>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</td>
      </tr>
   </xsl:template>
   <!--Шаблон для отображения даты по стандартам русской локали-->
   <xsl:template name="DateRu">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
            <xsl:value-of select="substring($text, 9, 2)"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="substring($text, 6, 2)"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="substring($text, 1, 4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--Информация о должностном лице-->
   <xsl:template match="gcrc:CustomsPerson">
      <table>
         <tr>
            <td class="graphUnderline">
               <xsl:apply-templates select="cat_ru:PersonName"/>
               <xsl:if test="cat_ru:LNP">
                  <xsl:text>, </xsl:text>
                  <xsl:apply-templates select="cat_ru:LNP"/>
               </xsl:if>
            </td>
         </tr>
         <tr>
            <td class="graph">ФИО должностного лица таможенного органа и ЛНП</td>
         </tr>
      </table>
   </xsl:template>
</xsl:stylesheet>

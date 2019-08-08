<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:err="urn:customs.ru:Information:ExchangeDocuments:ErrorList:5.14.2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="/">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Перечень ошибок, выявленных в процессе проведения форматно-логического контроля сведений, заявленных в электронной форме документа</title>
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
                        margin-bottom: 16pt;
                        counter-reset: document;
                    }

                    h2:before {
                        content: counter(document) ". ";
                        counter-increment: document;
                    }

                    h2 {
                        font-size: 14pt;
                        counter-reset: error;
                        text-align: center;
                    }

                    h3:before {
                        content: counter(document) "." counter(error) ". ";
                        counter-increment: error;
                    }

                    h3 {
						font-size: 13pt;
						margin-top: 10pt;
						margin-bottom: 2pt;
						}

                    span {font-weight: bold; margin-top: 0pt;}

                </style>
         </head>
         <body>
            <div class="page">
               <xsl:apply-templates select="err:ErrorList"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <!--Основной шаблон. Обрабатываем корневой элемент-->
   <xsl:template match="err:ErrorList">
      <h1>Перечень ошибок, выявленных в процессе проведения форматно-логического контроля сведений, заявленных в электронной форме документа</h1>
      <xsl:apply-templates select="err:Customs"/><br/>
      <span style="font-size: 13pt;">Дата направления: </span>
 	  <xsl:call-template name="DateRu">
		<xsl:with-param name="text" select="err:SendDate"/>
	  </xsl:call-template>
	  <br/><br/>
      <xsl:if test="err:BadDocument">
		  <span style="font-size: 13pt;">Документы с ошибками</span><br/>
			<table style="width:100%">
				<xsl:for-each select="err:BadDocument">
					<xsl:apply-templates select=".">
						<xsl:with-param name="nom_d" select="position()"/>
					</xsl:apply-templates>
				</xsl:for-each>
			</table>
      </xsl:if>
   </xsl:template>
   <xsl:template match="err:Customs">
      <span style="font-size: 13pt;">Таможенный орган: </span>
      <xsl:apply-templates select="cat_ru:Code"/>
      <xsl:if test="cat_ru:OfficeName">
         <xsl:text>, </xsl:text>
         <xsl:apply-templates select="cat_ru:OfficeName"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="err:BadDocument">
	   <xsl:param name="nom_d"/>
		<tr>
			<td style="width:5%; border-bottom: 1px solid black; vertical-align: middle" bgcolor="#e3e3e3" align="center">
				<span style="font-size: 13pt;"><xsl:value-of select="$nom_d"/>.</span>
			</td>
			<td style="width:95%; border-bottom: 1px solid black">
				<span>ID: </span><xsl:value-of select="err:DocID"/><br/>
				<xsl:if test="err:DocName">
					<span>Название: </span><xsl:value-of select="err:DocName"/><br/>
				</xsl:if>
				<xsl:if test="err:DocModeID">
					<span>Код вида документа: </span><xsl:value-of select="err:DocModeID"/>
				</xsl:if>
			</td>
		</tr>
		<xsl:for-each select="err:Error">
			<tr>
				<td style="width:5%"/>
				<td style="width:95%; border-bottom: 1px solid silver">
					<br/>
					<span>
						<xsl:value-of select="$nom_d"/>.<xsl:value-of select="position()"/>. 
						Ошибка: "<xsl:apply-templates select="err:ErrorName"/>"
					</span>
				</td>
			</tr>
			<tr>
				<td style="width:5%"/>
				<td style="width:95%; word-break: break-all"><xsl:apply-templates select="."/></td>
			</tr>
		</xsl:for-each>
		<tr>
			<td colspan="2"><br/></td>
		</tr>
   </xsl:template>
   <xsl:template match="err:Error">
 		<span>Дата и время обнаружения: </span>
        <xsl:call-template name="DateRu">
           <xsl:with-param name="text" select="err:DateInf"/>
        </xsl:call-template>
        <xsl:text>, </xsl:text>
        <xsl:call-template name="Time">
           <xsl:with-param name="text" select="err:TimeInf"/>
        </xsl:call-template>
 		<br/><span>Код ошибки: </span><xsl:value-of select="err:ErrCode"/>
		<xsl:if test="err:ErrCodeShort"> / <xsl:value-of select="err:ErrCodeShort"/></xsl:if>
		<br/><span>Уровень: </span><xsl:value-of select="err:ErrLevel"/>
		<xsl:if test="err:ErrField">
			<br/><span>Номер графа ДТ/ДТС/КТС: </span><xsl:value-of select="err:ErrField"/>
		</xsl:if>
		<xsl:if test="err:GTDGoodsNumber">
			<br/><span>Номер товара по ДТ/списку: </span><xsl:value-of select="err:GTDGoodsNumber"/>
		</xsl:if>
         <xsl:if test="err:ErrElement">
            <br/><span>Имя ошибочного узла/элемента/атрибута: </span><xsl:value-of select="err:ErrElement"/>
         </xsl:if>
         <xsl:if test="err:ErrElementDesc">
            <br/><span>Описание поля, в котором найдена ошибка: </span><xsl:value-of select="err:ErrElementDesc"/>
         </xsl:if>
         <xsl:if test="err:SuccessContent">
           <br/><span>Верное значение: </span><xsl:value-of select="err:SuccessContent"/>
         </xsl:if>
         <xsl:if test="err:CorrectValue">
            <br/><span>Верное (ожидаемое) значение: </span><xsl:value-of select="err:CorrectValue"/>
         </xsl:if>
         <xsl:if test="err:CodeOrder">
            <br/><span>Код нормативного документа: </span><xsl:value-of select="err:CodeOrder"/>
         </xsl:if>
         <xsl:if test="err:ErrDescription">
            <br/><span>Подробное описание ошибки: </span><xsl:apply-templates select="err:ErrDescription"/>
         </xsl:if>
         <xsl:if test="err:CriterionGroup">
            <br/><span>Группа критериев: </span><xsl:apply-templates select="err:CriterionGroup"/>
         </xsl:if>
         <xsl:if test="err:CriterionNum">
            <br/><span>Код критерия: </span><xsl:apply-templates select="err:CriterionNum"/>
         </xsl:if>
         <xsl:if test="err:TechID">
            <br/><span>Технические идентификаторы: </span>
            <xsl:for-each select="err:TechID">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
            </xsl:for-each>
         </xsl:if>
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
   <!--Форматирует время для отображения-->
   <xsl:template name="Time">
      <xsl:param name="text"/>
      <xsl:value-of select="substring($text, 1, 8)"/>
   </xsl:template>
</xsl:stylesheet>

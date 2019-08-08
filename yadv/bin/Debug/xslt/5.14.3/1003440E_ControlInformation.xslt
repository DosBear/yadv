<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ctlinf="urn:customs.ru:Information:TransportDocuments:ControlInformation:5.14.3" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0">
  <!-- Шаблон для типа ControlInformationType -->
  <xsl:template match="ctlinf:ControlInformation">
    <xsl:param name="w" select="190" />
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
                    <b>Информация о наличии подконтрольных товаров</b>
                  </font>
                </td>
              </tr>
            </tbody>
          </table>
          <br />
          <table>
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
          </xsl:if>
          <div class="title marg-top">Сведения о товарных партиях</div>
          <table class="bordered">
            <tbody>
              <tr class="title">
                <td class="graphMain bordered">Номер товара по порядку</td>
                <td class="graphMain bordered">1- Да; 2 - Нет; 3 Товар не подлежит санитарно-карантинному; ветеринарному; карантинному фитосанитарному контролю по причине "...."</td>
                <td class="graphMain bordered">Необходимость проведения вет контроля</td>
                <td class="graphMain bordered">Необходимость проведения санитарно-карантийного контроля</td>
                <td class="graphMain bordered">Нобходимость проведения фитосанитарного карантийного контроля</td>
                <td class="graphMain bordered">Комментарий пользователя</td>
                <td class="graphMain bordered">Автор комментария</td>
                <td class="graphMain bordered">Дата решения</td>
                <td class="graphMain bordered">Номер коносамента</td>
                <td class="graphMain bordered">Номер ЗТК</td>
                <td class="graphMain bordered">Наименование ЗТК</td>
                <td class="graphMain bordered">Информация о контейнерах</td>
              </tr>
              <xsl:for-each select="ctlinf:ControledGood">
                <xsl:apply-templates select=".">
                  <xsl:with-param name="wdth" select="$w" />
                </xsl:apply-templates>
              </xsl:for-each>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа ctlinf:ContainerType -->
  <xsl:template match="ctlinf:Container">
	<xsl:value-of select="ctlinf:ContainerNum" />
	<xsl:if test="ctlinf:ZTKNum">
		<xsl:text>, № ЗТК:</xsl:text>
		<xsl:value-of select="ctlinf:ZTKNum" />
	</xsl:if>
	<xsl:if test="ctlinf:ZTKName">
		<xsl:text>, Наименование ЗТК:</xsl:text>
		<xsl:value-of select="ctlinf:ZTKName" />
	</xsl:if>
  </xsl:template>
  <!-- Шаблон для типа ctlinf:ConsignmentsType -->
  <xsl:template match="ctlinf:ControledGood">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:value-of select="ctlinf:GoodsNumeric" />
        </td>
        <td class="graphMain bordered">
              <xsl:value-of select="ctlinf:Decision" />
        </td>
        <td class="graphMain bordered">
          <xsl:choose>
            <xsl:when test="ctlinf:VetDecision='1'">
              <xsl:text>Да</xsl:text>
            </xsl:when>
            <xsl:when test="ctlinf:VetDecision='2'">
              <xsl:text>Нет</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="ctlinf:VetDecision" />
            </xsl:otherwise>
          </xsl:choose>
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="translate(ctlinf:SKKDecision, '.', ',')" />
        </td>
        <td class="graphMain bordered">
          <xsl:choose>
            <xsl:when test="ctlinf:FKKtDecision='1'">
              <xsl:text>Да</xsl:text>
            </xsl:when>
            <xsl:when test="ctlinf:FKKtDecision='2'">
              <xsl:text>Нет</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="ctlinf:FKKtDecision" />
            </xsl:otherwise>
          </xsl:choose>
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="ctlinf:Reason" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="ctlinf:Author" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="ctlinf:Date" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="ctlinf:ConsignmentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="ctlinf:ZTKNum" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="ctlinf:ZTKName" />
        </td>
        <td class="graphMain bordered">
          <xsl:if test="ctlinf:Container">
			<xsl:for-each select="ctlinf:Container">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">;<br/></xsl:if>
			</xsl:for-each>
          </xsl:if>
        </td>
      </tr>
    </div>
  </xsl:template>
  <xsl:template name="russian_date">
    <xsl:param name="dateIn" />
    <xsl:choose>
      <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
        <xsl:value-of select="substring($dateIn,9,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,6,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,1,4)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$dateIn" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
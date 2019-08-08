<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:ec="urn:customs.ru:Information:CustomsDocuments:ExpertiseCancel:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <!-- Шаблон для типа ExpertiseCancelType -->
  <xsl:template match="ec:ExpertiseCancel">
    <xsl:param name="w" select="180" />
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

                  .header
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 13pt;
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
                  padding-left: 3px;
                  padding-right: 3px;
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
                <td align="center" class="header">
					<xsl:choose>
						<xsl:when test="string(ec:DocType)='0'">Отзыв экспертно-исследовательской работы</xsl:when>
						<xsl:when test="string(ec:DocType)='1'">Отказ в проведении экспертно-исследовательской работы</xsl:when>
						<xsl:otherwise>Неизвестный документ</xsl:otherwise>
					</xsl:choose>
                </td>
              </tr>
            </tbody>
          </table>
          <br />
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
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">
				<xsl:choose>
					<xsl:when test="string(ec:DocType)='0'">Дата формирования</xsl:when>
					<xsl:when test="string(ec:DocType)='1'">Дата формирования отказа</xsl:when>
					<xsl:otherwise>Дата формирования документа</xsl:otherwise>
				</xsl:choose>
			  </td>
              <td class="value graphMain" style="width:50%">
                <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="ec:DocDate" />
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <xsl:if test="string(ec:DocType)='1'">
			<table>
			  <tr>
				<td class="annot graphMain" style="width:50%">Номер документа (Отказа)</td>
				<xsl:choose>
					<xsl:when test="ec:DocNumber">
							<td class="value graphMain" style="width:50%">
							  <xsl:value-of select="ec:DocNumber" />
							</td>
					</xsl:when>
					<xsl:otherwise>
							<td class="value graphMain" style="width:50%">б/н</td>
					</xsl:otherwise>
				</xsl:choose>
			  </tr>
			</table>
          </xsl:if>
          <xsl:if test="ec:RequestID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Номер запроса</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="ec:RequestID" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="ec:Division">
            <div class="title marg-top">
				<xsl:choose>
					<xsl:when test="string(ec:DocType)='0'">Код и наименование подразделения, сформировавшего Отзыв</xsl:when>
					<xsl:when test="string(ec:DocType)='1'">Код и наименование подразделения ЦЭКТУ</xsl:when>
					<xsl:otherwise>Код и наименование подразделения, сформировавшего документ</xsl:otherwise>
				</xsl:choose>
            </div>
            <div>
              <xsl:apply-templates select="ec:Division">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="ec:DocBaseInfo">
            <div class="title marg-top">
				<xsl:choose>
					<xsl:when test="string(ec:DocType)='0'">Документ, на основании которого отзывается ЭИР</xsl:when>
					<xsl:when test="string(ec:DocType)='1'">Документ-основание, в соответствии с которым формируется отказ</xsl:when>
					<xsl:otherwise>Документ, на основании которого сформирован текущий документ</xsl:otherwise>
				</xsl:choose>
            </div>
            <div>
              <xsl:apply-templates select="ec:DocBaseInfo">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="ec:ParagraphInfo">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="string(ec:DocType)='0'">Номер статьи, в соответствии с которой отзывается ЭИР</xsl:when>
						<xsl:when test="string(ec:DocType)='1'">Номер статьи, пункта, подпункта в соответствии с которым формируется отказ</xsl:when>
						<xsl:otherwise>Номер статьи, пункта, подпункта документа, на основании которого формируется текущий документ</xsl:otherwise>
					</xsl:choose>
                </td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="ec:ParagraphInfo" />
                </td>
              </tr>
            </table>
          </xsl:if>
		  <br/>
          <table>
            <tr>
              <td class="graphMain value" style="width:100%">
                <xsl:for-each select="ec:DocText">
                  <xsl:value-of select="." />
                  <!--xsl:if test="position()!=last()">
                    <xsl:text>, </xsl:text>
                  </xsl:if-->
                </xsl:for-each>
              </td>
            </tr>
          </table>
          <xsl:if test="ec:ExecutiveInfo">
            <div class="title marg-top">
				<xsl:choose>
					<xsl:when test="string(ec:DocType)='0'">Должностное лицо, сформировавшее Отзыв</xsl:when>
					<xsl:when test="string(ec:DocType)='1'">Должностное лицо ЦЭКТУ</xsl:when>
					<xsl:otherwise>Должностное лицо, сформировавшее документ</xsl:otherwise>
				</xsl:choose>
            </div>
            <div>
              <xsl:apply-templates select="ec:ExecutiveInfo">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа ec:DivisionInformationType -->
  <xsl:template match="ec:Division">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код подразделения</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="ec:CustomsCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Наименование подразделения</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="ec:Name" />
          </td>
        </tr>
      </table>
      <xsl:if test="ec:Address">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Адрес подразделения</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="ec:Address" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="ec:DocBaseInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PrDocumentName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PrDocumentName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PrDocumentNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа ec:PersonType -->
  <xsl:template match="ec:ExecutiveInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PersonPost">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Должность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PersonPost" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Фамилия</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:PersonSurname" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Имя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:PersonName" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:PersonMiddleName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Отчество</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PersonMiddleName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Телефон должностного лица</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="ec:Phone" />
          </td>
        </tr>
      </table>
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
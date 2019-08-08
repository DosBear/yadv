<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:exp_s="urn:customs.ru:Information:CustomsDocuments:ExpertSignature:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <!-- Шаблон для типа ExpertSignatureType -->
  <xsl:template match="exp_s:ExpertSignature">
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
                <td align="center" class="title">
                  <font size="4">
                    <b>Уведомление об ознакомлении эксперта со своими правами и обязанностями (Подписка Эксперта)</b>
                  </font>
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
              <td class="annot graphMain" style="width:50%">Дата формирования Уведомления об ознакомлении эксперта со своими правами и обязанностями (Подписки Эксперта)</td>
              <td class="value graphMain" style="width:50%">
                <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="exp_s:DateExpertSignature" />
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <xsl:if test="exp_s:CEKTUDivision">
            <div class="title marg-top">Код и наименование подразделения ЦЭКТУ</div>
            <div>
              <xsl:apply-templates select="exp_s:CEKTUDivision">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="exp_s:TypeProcess">
            <div class="title marg-top">Тип процесса</div>
            <div>
              <xsl:apply-templates select="exp_s:TypeProcess">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
		  <br/>
          <table>
            <tr>
              <td class="annot graphMain" style="width:100%">Описание прав и обязанностей эксперта:</td>
            </tr>
            <tr>
              <td class="graphMain value" style="width:100%">
                <xsl:for-each select="exp_s:DescriptionRightsAndDuties">
                  <xsl:value-of select="." />
                  <xsl:if test="position()!=last()">
                    <xsl:text>, </xsl:text>
                  </xsl:if>
                </xsl:for-each>
              </td>
            </tr>
          </table>
          <xsl:if test="exp_s:ExpertInfo">
            <div class="title marg-top">Эксперт</div>
            <div>
              <xsl:apply-templates select="exp_s:ExpertInfo">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа exp_s:CEKTUDivisionInformationType -->
  <xsl:template match="exp_s:CEKTUDivision">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код подразделения ЦЭКТУ</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="exp_s:CustomsCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Наименование подразделения ЦЭКТУ</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="exp_s:Name" />
          </td>
        </tr>
      </table>
      <xsl:if test="exp_s:Address">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Адрес подразделения ЦЭКТУ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="exp_s:Address" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа exp_s:PersonType -->
  <xsl:template match="exp_s:ExpertInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
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
          <td class="annot graphMain" style="width:50%">Телефон должностного лица</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="exp_s:Phone" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа exp_s:TypeProcessType -->
  <xsl:template match="exp_s:TypeProcess">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Тип процесса</td>
          <td class="value graphMain" style="width:50%">
            <xsl:choose>
              <xsl:when test="exp_s:TypeProcessCode='1'">
                <xsl:text>Дело об АП</xsl:text>
              </xsl:when>
              <xsl:when test="exp_s:TypeProcessCode='2'">
                <xsl:text>Сообщение о преступлении</xsl:text>
              </xsl:when>
              <xsl:when test="exp_s:TypeProcessCode='3'">
                <xsl:text>Уголовное дело</xsl:text>
              </xsl:when>
              <xsl:when test="exp_s:TypeProcessCode='9'">
                <xsl:text>Иное</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="exp_s:TypeProcessCode" />
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
      </table>
      <xsl:if test="exp_s:TypeProcessText">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Иной тип процесса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="exp_s:TypeProcessText" />
            </td>
          </tr>
        </table>
      </xsl:if>
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
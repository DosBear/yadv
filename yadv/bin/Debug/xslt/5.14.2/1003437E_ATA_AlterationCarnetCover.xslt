<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ata_ct="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CommonTypes:5.14.0" xmlns:ata_acc="urn:customs.ru:Information:TransportDocuments:ATA:ATA_AlterationCarnetCover:5.14.0">
  <!-- Шаблон для типа ATA_AlterationCarnetCoverType -->
  <xsl:template match="ata_acc:ATA_AlterationCarnetCover">
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
                    <b>Корректировка обложки карнета АТА</b>
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
              <td class="annot graphMain" style="width:50%">Дата и время внесения изменений</td>
              <td class="value graphMain" style="width:50%">
                <xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ata_acc:IssueDate"/>
                </xsl:call-template>
                <xsl:text> </xsl:text>
                <xsl:value-of select="substring(ata_acc:IssueDate,12,5)" />
              </td>
            </tr>
          </table>
          <xsl:if test="ata_acc:AlterationCarnetCover">
            <div class="title marg-top">Измененная обложка карнета АТА</div>
            <div>
              <xsl:apply-templates select="ata_acc:AlterationCarnetCover"/>
            </div>
            <br/>
          </xsl:if>
          <xsl:if test="ata_acc:CarnetRevision">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Версия карнета АТА</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="ata_acc:CarnetRevision" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Этап внесения изменений в обложку карнета АТА</td>
              <td class="value graphMain" style="width:50%">
                <xsl:choose>
                  <xsl:when test="ata_acc:AlterationMode='1'">
                    <xsl:text>до выпуска</xsl:text>
                  </xsl:when>
                  <xsl:when test="ata_acc:AlterationMode='2'">
                    <xsl:text>после выпуска</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="ata_acc:AlterationMode" />
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </table>
          <xsl:if test="ata_acc:PreviousCarnetNumber">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Номер предыдущего карнета АТА. Заполняется в случае корректировки номера карнета АТА</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="ata_acc:PreviousCarnetNumber" />
                </td>
              </tr>
            </table>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа ata_ct:DocumentBodyType -->
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
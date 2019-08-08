<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:naccbi="urn:customs.ru:Information:CommercialFinanceDocuments:NoticeAccBalanceInfo:5.13.4">
  <!-- Шаблон для типа NoticeAccBalanceInfoType -->
  <xsl:template match="naccbi:NoticeAccBalanceInfo">
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
                    <b>Сообщение об остатках денежных средств (драгоценных металлов) на счетах плательщика (лица, несущего солидарную обязанность) в банке и об остатках электронных денежных средств</b>
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
              <td class="annot graphMain" style="width:50%">Дата Сведений</td>
              <td class="value graphMain" style="width:50%">
                <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="naccbi:DocDate" />
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Номер Сведений</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="naccbi:DocNumber" />
              </td>
            </tr>
          </table>
          <xsl:if test="naccbi:BankInformation">
            <div class="title marg-top">Информация о банке и счёте плательщика</div>
            <div>
              <xsl:apply-templates select="naccbi:BankInformation">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="naccbi:Performer">
            <div class="title marg-top">Исполнитель, предоставляющий сведения</div>
            <div>
              <xsl:apply-templates select="naccbi:Performer">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="naccbi:DecisionSuspend">
            <div class="title marg-top">Дата и номер решения о приостановлении операций по счетам плательщика (лица, несущего солидарную обязанность) в банке и переводов его электронных денежных средств</div>
            <div>
              <xsl:apply-templates select="naccbi:DecisionSuspend">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="naccbi:Payer">
            <div class="title marg-top">Реквизиты плательщика</div>
            <div>
              <xsl:apply-templates select="naccbi:Payer">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Код валюты (в соответствии с Общероссийским классификатором валют)</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="naccbi:CurrencyCode" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Остаток денежных средств, электронных денежных средств</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="translate(naccbi:Balance, '.', ',')" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Дата, по состоянию на которую предоставлены данные</td>
              <td class="value graphMain" style="width:50%">
                <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="naccbi:StateDate" />
                </xsl:call-template>
              </td>
            </tr>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:BankInformationType -->
  <xsl:template match="naccbi:BankInformation">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер банковского счета</td>
          <td class="graphMain value" style="width:50%">
            <xsl:for-each select="cat_ru:BankAccount">
              <xsl:value-of select="." />
              <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
              </xsl:if>
            </xsl:for-each>
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Описание типа счета: расчетный, валютный</td>
          <td class="graphMain value" style="width:50%">
            <xsl:for-each select="cat_ru:BankAccountDescription">
              <xsl:value-of select="." />
              <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
              </xsl:if>
            </xsl:for-each>
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Название банка</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:BankName" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:BankMFO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">МФО банка</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:BankMFO" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:OKPOID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код банка по ОКПО</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OKPOID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:BICID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">БИК банка</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:BICID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SWIFTID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">SWIFT код банка</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:SWIFTID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CorrAccount">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер корреспондентского счета банка</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:CorrAccount" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:TransitCurrencyAccount">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Валютный счет организации (транзитный)</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:TransitCurrencyAccount">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Валютный счет организации (специальный транзитный)</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="naccbi:DecisionSuspend">
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
  <!-- Шаблон для типа naccbi:PayerType -->
  <xsl:template match="naccbi:Payer">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Наименование плательщика</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="naccbi:OrganizationName" />
          </td>
        </tr>
      </table>
      <xsl:if test="naccbi:INN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН плательщика</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="naccbi:INN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="naccbi:KPP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код постановки на учет (КПП) плательщика</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="naccbi:KPP" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа naccbi:PersonInfoType -->
  <xsl:template match="naccbi:Performer">
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
      <xsl:if test="naccbi:Phone">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телефона</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="naccbi:Phone">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
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
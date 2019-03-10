{* BahaiCalendar.pas by Dave Pearson <davep@davep.org>
 * $Revision: 1.8 $
 *
 * This Delphi unit contains functions that should be useful for writing
 * Bah�'� celendar oriented applications. The code for converting from/to
 * Bah�'�/Gregorian dates is based on the information in the book
 * _Calendrical Calculations_ by Nachum Dershowitz and Edward M. Reingold.
 * See <URL:http://www.calendarists.com/> for more details about the book.
 *
 * You are free to use this code in any of your applications for any
 * non-commercial purpose. If your application is considered to be a
 * "commercial" application you have my permission to use my code but you
 * must seek permission from Dershowitz and Reingold to use any of the date
 * conversion code.
 *
 * Commercial and non-commercial should be taken to mean what Dershowitz and
 * Reingold mean when they use those terms. If you are in any doubt about
 * your rights to use this code in your applications you should contact
 * Dershowitz and Reingold and seek clarification and permission.
 *
 * The latest version of this code can always be found at:
 *
 * <URL:https://github.com/davep/BahaiCalendar.pas>
 *
 * $Log: BahaiCalendar.pas,v $
 * Revision 1.8  2002/09/02 10:48:56  davep
 * Added BahaiYearName().
 *
 * Revision 1.7  2002/08/30 14:44:21  davep
 * Added the TBahaiText type.
 * Changed all name functions so that they take a TBahaiText type instead of a
 * boolean value as the parameter that dictates what language to return.
 *
 * Revision 1.6  2002/08/29 18:10:34  davep
 * Changed the URL for _Calendrical Calculations_.
 *
 * Revision 1.5  2002/08/29 17:36:38  davep
 * Fixed a typo in the usage information.
 *
 * Revision 1.4  2002/08/29 17:31:59  davep
 * Added comments on usage rights.
 *
 * Revision 1.3 2002/08/29 10:26:09 davep
 * Added BahaiMajorName().
 * Added BahaiDayOrdinal().
 *
 * Revision 1.2 2002/08/28 17:38:51 davep
 * Added functions for testing for feasts, holy days and fasts.
 * Added overloaded versions of all functions that date a TGDate or a TBDate
 * so that they now also take a TDateTime.
 *
 * Revision 1.1 2002/08/28 14:12:23 davep
 * Initial revision
 *
 *}

Unit BahaiCalendar;

Interface

Type

  {** A "fixed" date type is simply an integer }
  TFDate = Integer;

  {** Record for holding all the parts of a Gregorian date }
  TGDate = Record
    iYear  : Integer;
    iMonth : Integer;
    iDay   : Integer;
  End;

  {** Record for holding all the parts of a Bah�'� date }
  TBDate = Record
    iMajor : Integer;
    iCycle : Integer;
    iYear  : Integer;
    iMonth : Integer;
    iDay   : Integer;
  End;

  {** Types of text available from the various names functions }
  TBahaiText = ( tbtArabic, tbtEnglish );

{** Create a Gregorian date }
Function GregorianDate( iYear : Integer; iMonth : Integer; iDay : Integer ) : TGDate; Overload;
{** Create a Gregorian date from a Delphi TDateTime value }
Function GregorianDate( dt : TDateTime ) : TGDate; Overload;
{** Is the year a leap year in the Gregorian Calendar? }
Function GregorianLeapYear( iYear : Integer ) : Boolean;
{** Return a fixed date from a Gregorian date }
Function FixedFromGregorian( fd : TGDate ) : TFDate;
{** Return the Gregorian year of a fixed date }
Function GregorianYearFromFixed( fd : TFDate ) : Integer;
{** Return a Gregorian date from a fixed date }
Function GregorianFromFixed( fd : TFDate ) : TGDate;
{** Create a Bah�'� date }
Function BahaiDate( iMajor : Integer; iCycle : Integer; iYear : Integer; iMonth : Integer; iDay : Integer ) : TBDate;
{** Return a fixed date from a Bah�'� date }
Function FixedFromBahai( bd : TBDate ) : TFDate;
{** Return a Bah�'� date from a fixed date }
Function BahaiFromFixed( fd : TFDate ) : TBDate;
{** Return the Gregorian date for the given Bah�'� date }
Function GregorianFromBahai( bd : TBDate ) : TGDate;
{** Return the Bah�'� date for the given Gregorian date }
Function BahaiFromGregorian( gd : TGDate ) : TBDate;
{** Return the fixed date of the Bah�'� new year for the given Gregorian year }
Function BahaiNewYear( iGYear : Integer ) : TFDate;
{** Return the BE year from the given Bah�'� date }
Function BahaiYear( bd : TBDate ) : Integer; Overload;
{** Return the BE year from the given Gregorian date }
Function BahaiYear( gd : TGDate ) : Integer; Overload;
{** Return the BE year from the given Delphi date }
Function BahaiYear( td : TDateTime ) : Integer; Overload;
{** Return the day of the week from the given Bah�'� date }
Function BahaiDayOfWeek( bd : TBDate ) : Integer;
{** Is the passed Bah�'� date a Bah�'� intercalary date? }
Function IsBahaiIntercalary( bd : TBDate ) : Boolean; Overload;
{** Is the passed Gregorian date a Bah�'� intercalary date? }
Function IsBahaiIntercalary( gd : TGDate ) : Boolean; Overload;
{** Is the passed Delphi date a Bah�'� intercalary date? }
Function IsBahaiIntercalary( td : TDateTime ) : Boolean; Overload;
{** Return the name of the week day of the passed Bah�'� date }
Function BahaiWeekDayName( bd : TBDate; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the name of the Bah�'� week day of the passed Gregorian date }
Function BahaiWeekDayName( gd : TGDate; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the name of the Bah�'� week day of the passed Delphi date }
Function BahaiWeekDayName( td : TDateTime; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the name of the month of the passed Bah�'� date }
Function BahaiMonthName( bd : TBDate; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the name of the Bah�'� month of the passed Gregorian date }
Function BahaiMonthName( gd : TGDate; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the name of the Bah�'� month of the passed Delphi date }
Function BahaiMonthName( td : TDateTime; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the name of the day of the passed Bah�'� date }
Function BahaiDayName( bd : TBDate; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the name of the Bah�'� day of the passed Gregorian date }
Function BahaiDayName( gd : TGDate; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the name of the Bah�'� day of the passed Delphi date }
Function BahaiDayName( td : TDateTime; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the ordinal name of the Bah�'� day of the passed Bah�'� date }
Function BahaiDayOrdinal( bd : TBDate ) : String; Overload;
{** Return the ordinal name of the Bah�'� day of the passed Gregorian date }
Function BahaiDayOrdinal( gd : TGDate ) : String; Overload;
{** Return the ordinal name of the Bah�'� day of the passed Delphi date }
Function BahaiDayOrdinal( td : TDateTime ) : String; Overload;
{** Return the name of the year of the passed Bah�'� date }
Function BahaiYearName( bd : TBDate; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the name of the Bah�'� year of the passed Gregorian date }
Function BahaiYearName( gd : TGDate; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the name of the Bah�'� year of the passed Delphi date }
Function BahaiYearName( td : TDateTime; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the name of the cycle of the passed Bah�'� date }
Function BahaiCycleName( bd : TBDate; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the name of the Bah�'� cycle of the passed Gregorian date }
Function BahaiCycleName( gd : TGDate; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the name of the Bah�'� cycle of the passed Delphi date }
Function BahaiCycleName( td : TDateTime; tbt : TBahaiText = tbtArabic ) : String; Overload;
{** Return the "name" of the Bah�'� major cycle of the passed Bah�'� date }
Function BahaiMajorName( bd : TBDate ) : String; Overload;
{** Return the "name" of the Bah�'� major cycle of the passed Gregorian date }
Function BahaiMajorName( gd : TGDate ) : String; Overload;
{** Return the "name" of the Bah�'� major cycle of the passed Delphi date }
Function BahaiMajorName( td : TDateTime ) : String; Overload;
{** Is the passed Gregorian date in the feast of Ridvan? }
Function IsBahaiFeastOfRidvan( gd : TGDate ) : Boolean; Overload;
{** Is the passed Bah�'� date in the feast of Ridvan? }
Function IsBahaiFeastOfRidvan( bd : TBDate ) : Boolean; Overload;
{** Is the passed Delphi date in the feast of Ridvan? }
Function IsBahaiFeastOfRidvan( td : TDateTime ) : Boolean; Overload;
{** Is the passed Bah�'� date a Bah�'� feast day? }
Function IsBahaiFeastDay( bd : TBDate ) : Boolean; Overload;
{** Is the passed Gregorian date a Bah�'� feast day? }
Function IsBahaiFeastDay( gd : TGDate ) : Boolean; Overload;
{** Is the passed Delphi date a Bah�'� feast day? }
Function IsBahaiFeastDay( td : TDateTime ) : Boolean; Overload;
{** Is the passed Gregorian date a Bah�'� holy day? }
Function IsBahaiHolyDay( gd : TGDate ) : Boolean; Overload;
{** Is the passed Bah�'� date a Bah�'� holy day? }
Function IsBahaiHolyDay( bd : TBDate ) : Boolean; Overload;
{** Is the passed Delphi date a Bah�'� holy day? }
Function IsBahaiHolyDay( td : TDateTime ) : Boolean; Overload;
{** Is the passed Gregorian date an "important" Bah�'� day? }
Function IsBahaiImportantDay( gd : TGDate ) : Boolean; Overload;
{** Is the passed Bah�'� date an "important" Bah�'� day? }
Function IsBahaiImportantDay( bd : TBDate ) : Boolean; Overload;
{** Is the passed Delphi date an "important" Bah�'� day? }
Function IsBahaiImportantDay( td : TDateTime ) : Boolean; Overload;
{** Is the passed Bah�'� date a Bah�'� fast day? }
Function IsBahaiFastDay( bd : TBDate ) : Boolean; Overload;
{** Is the passed Gregorian date a Bah�'� fast day? }
Function IsBahaiFastDay( gd : TGDate ) : Boolean; Overload;
{** Is the passed Delphi date a Bah�'� fast day? }
Function IsBahaiFastDay( td : TDateTime ) : Boolean; Overload;

Implementation

Uses
  Math,
  SysUtils;

Const

  {** R.D. date of the Gregorian epoch. }
  GREGORIAN_EPOCH = 1;
  {** R.D. date of the Bah�'� epoch. 1844-03-21 in the Gregorian calendar. }
  BAHAI_EPOCH = 673222;

// Delphi's Mod operator doesn't handle negative values in the way that
// CL's `mod' function does. This function should make things work right.
Function CalMod( X : Integer; Y : Integer ) : Integer;
Begin
  Result := ( ( X Mod Y ) + Y ) Mod Y;
End;

/////

Function GregorianDate( iYear : Integer; iMonth : Integer; iDay : Integer ) : TGDate;
Begin
  Result.iYear  := iYear;
  Result.iMonth := iMonth;
  Result.iDay   := iDay;
End;

/////

Function GregorianDate( dt : TDateTime ) : TGDate;
Var
  wYear  : Word;
  wMonth : Word;
  wDay   : Word;
Begin

  // Get the date from the datetime value.
  DecodeDate( dt, wYear, wMonth, wDay );

  // Return the date values.
  Result.iYear  := wYear;
  Result.iMonth := wMonth;
  Result.iDay   := wDay;

End;

/////

Function GregorianLeapYear( iYear : Integer ) : Boolean;
Begin
  // Simply call Delphi's leap year function.
  Result := IsLeapYear( iYear );
End;

/////

Function FixedFromGregorian( fd : TGDate ) : TFDate;

  Function LYFixUp : Integer;
  Begin
    If fd.iMonth <= 2 Then
      Result := 0
    Else If GregorianLeapYear( fd.iYear ) Then
      Result := -1
    Else
      Result := -2;
  End;

Begin
  Result := ( GREGORIAN_EPOCH - 1 )                     +
            ( 365 * ( fd.iYear - 1 ) )                  +
            Floor( ( fd.iYear - 1 ) / 4 )               -
            Floor( ( fd.iYear - 1 ) / 100 )             +
            Floor( ( fd.iYear - 1 ) / 400 )             +
            Floor( ( ( fd.iMonth * 367 ) - 362 ) / 12 ) +
            LYFixUp()                                   +
            fd.iDay;
End;

/////

Function GregorianYearFromFixed( fd : TFDate ) : Integer;
Var
  d0    : Integer;
  n400  : Integer;
  d1    : Integer;
  n100  : Integer;
  d2    : Integer;
  n4    : Integer;
  d3    : Integer;
  n1    : Integer;
{ d4    : Integer; }
Begin

  // Prior days.
  d0 := fd - GREGORIAN_EPOCH;

  // Completed 400-year cycles.
  n400 := Floor( d0 / 146097 );

  // Prior days not in n400.
  d1 := CalMod( d0, 146097 );

  // 100-year cycles not in n400.
  n100 := Floor( d1 / 36524 );

  // Prior days not in n400 or n100.
  d2 := CalMod( d1, 36524 );

  // 4-year cycles not in n400 or n100.
  n4 := Floor( d2 / 1461 );

  // Prior days not in n400, n100 or n4.
  d3 := CalMod( d2, 1461 );

  // Years not in n400, n100 or n4.
  n1 := Floor( d3 / 365 );

  // Prior days not in n400, n100, n4 or n1.
{ d4 := ( CalMod( d3, 365 ) ) + 1; }

  // Now we can work out the year.
  Result := ( 400 * n400 ) + ( 100 * n100 ) + ( 4 * n4 ) + n1;

  // Final fixup.
  If Not ( ( n100 = 4 ) Or ( n1 = 4 ) ) Then
    Inc( Result );

End;

/////

Function GregorianFromFixed( fd : TFDate ) : TGDate;
Var
  iPriorDays : Integer;
  iLeap      : Integer;
Begin

  // Get the year.
  Result.iYear := GregorianYearFromFixed( fd );

  // Days so far this year.
  iPriorDays := fd - FixedFromGregorian( GregorianDate( Result.iYear, 1, 1 ) );

  // Leap correction.
  If fd < FixedFromGregorian( GregorianDate( Result.iYear, 3, 1 ) ) Then
    iLeap := 0
  Else If GregorianLeapYear( Result.iYear ) Then
    iLeap := 1
  Else
    iLeap := 2;

  // Work out the month.
  Result.iMonth := Floor( ( ( ( iPriorDays + iLeap ) * 12 ) + 373 ) / 367 );

  // Work out the day.
  Result.iDay := ( fd - FixedFromGregorian( GregorianDate( Result.iYear, Result.iMonth, 1 ) ) ) + 1;

End;

/////

Function BahaiDate( iMajor : Integer; iCycle : Integer; iYear : Integer; iMonth : Integer; iDay : Integer ) : TBDate;
Begin
  Result.iMajor := iMajor;
  Result.iCycle := iCycle;
  Result.iYear  := iYear;
  Result.iMonth := iMonth;
  Result.iDay   := iDay;
End;

/////

Function FixedFromBahai( bd : TBDate ) : TFDate;
Var
  iGYear : Integer;
Begin

  // Gregorian year for the Bah�'� date.
  iGYear := ( 361 * ( bd.iMajor - 1 ) ) +
            (  19 * ( bd.iCycle - 1 ) ) +
            bd.iYear                    -
            1                           +
            GregorianYearFromFixed( BAHAI_EPOCH );

  // Calculate the fixed.
  Result := FixedFromGregorian( GregorianDate( iGYear, 3, 20 ) ) + ( 19 * ( bd.iMonth - 1 ) ) + bd.iDay;

  // Fix up for intercalary days.
  If bd.iMonth = 20 Then
    If GregorianLeapYear( iGYear + 1 ) Then
      Dec( Result, 14 )
    Else
      Dec( Result, 15 );

End;

/////

Function BahaiFromFixed( fd : TFDate ) : TBDate;
Var
  iGYear : Integer;
  iStart : Integer;
  iYears : Integer;
  iDays  : Integer;
Begin

  // Get the gregorian year for the fixed date.
  iGYear := GregorianYearFromFixed( fd );

  // First year of the BE.
  iStart := GregorianYearFromFixed( BAHAI_EPOCH );

  // Years since the start of BE.
  iYears := iGYear - iStart;

  // Fix up the year if we're really in the previous Bah�'� year.
  If ( FixedFromGregorian( GregorianDate( iGYear, 1,  1 ) ) <= fd ) And
     ( FixedFromGregorian( GregorianDate( iGYear, 3, 20 ) ) >= fd ) Then
     Dec( iYears );

  // Calculate the major cycle.
  Result.iMajor := Floor( iYears / 361 ) + 1;

  // Calculate the cycle.
  Result.iCycle := Floor( CalMod( iYears, 361 ) / 19 ) + 1;

  // Calculate the year.
  Result.iYear := CalMod( iYears, 19 ) + 1;

  // Calculate the number of days since the start of the year.
  iDays := fd - FixedFromBahai( BahaiDate( Result.iMajor, Result.iCycle, Result.iYear, 1, 1 ) );

  // Calculate the month.
  If fd >= FixedFromBahai( BahaiDate( Result.iMajor, Result.iCycle, Result.iYear, 20, 1 ) ) Then
    Result.iMonth := 20
  Else
    Result.iMonth := Floor( iDays / 19 ) + 1;

  // Calculate the day.
  Result.iDay := ( fd - FixedFromBahai( BahaiDate( Result.iMajor, Result.iCycle, Result.iYear, Result.iMonth, 1 ) ) ) + 1;

End;

/////

Function GregorianFromBahai( bd : TBDate ) : TGDate;
Begin
  Result := GregorianFromFixed( FixedFromBahai( bd ) );
End;

/////

Function BahaiFromGregorian( gd : TGDate ) : TBDate;
Begin
  Result := BahaiFromFixed( FixedFromGregorian( gd ) );
End;

/////

Function BahaiNewYear( iGYear : Integer ) : TFDate;
Begin
  Result := FixedFromGregorian( GregorianDate( iGYear, 3, 21 ) );
End;

/////

Function BahaiYear( bd : TBDate ) : Integer;
Begin
  Result := ( ( bd.iMajor - 1 ) * 361 ) + ( ( bd.iCycle - 1 ) * 19 ) + bd.iYear;
End;

/////

Function BahaiYear( gd : TGDate ) : Integer;
Begin
  Result := BahaiYear( BahaiFromGregorian( gd ) );
End;

/////

Function BahaiYear( td : TDateTime ) : Integer;
Begin
  Result := BahaiYear( GregorianDate( td ) );
End;

/////

Function BahaiDayOfWeek( bd : TBDate ) : Integer;
Begin
  With GregorianFromBahai( bd ) Do
    Result := DayOfWeek( EncodeDate( iYear, iMonth, iDay ) );
End;

/////

Function IsBahaiIntercalary( bd : TBDate ) : Boolean;
Begin
  Result := bd.iMonth = 19;
End;

/////

Function IsBahaiIntercalary( gd : TGDate ) : Boolean;
Begin
  Result := IsBahaiIntercalary( BahaiFromFixed( FixedFromGregorian( gd ) ) );
End;

/////

Function IsBahaiIntercalary( td : TDateTime ) : Boolean;
Begin
  Result := IsBahaiIntercalary( GregorianDate( td ) );
End;

/////

Function Translate( tbt : TBahaiText; Const sArabic : String; Const sEnglish : String ) : String;
Begin
  If tbt = tbtArabic Then Result := sArabic Else Result := sEnglish;
End;

/////

Function OrdinalSuffix( i : Integer ) : String;
Begin

  i := Abs( i );

  If ( ( i Mod 100 ) > 9 ) And ( ( i Mod 100 ) < 20 ) Then
    Result := 'th'
  Else
    Case i Mod 10 Of
      1 : Result := 'st';
      2 : Result := 'nd';
      3 : Result := 'rd';
    Else
      Result := 'th';
    End;

End;

/////

Function BahaiWeekDayName( bd : TBDate; tbt : TBahaiText ) : String;
Begin

  Case BahaiDayOfWeek( bd ) Of
    1 : Result := Translate( tbt, 'Jam�l',    'Beauty' );
    2 : Result := Translate( tbt, 'Kam�l',    'Perfection' );
    3 : Result := Translate( tbt, 'Fid�l',    'Grace' );
    4 : Result := Translate( tbt, 'Id�l',     'Justice' );
    5 : Result := Translate( tbt, 'Istijl�l', 'Majesty' );
    6 : Result := translate( tbt, 'Istiql�l', 'Independance' );
    7 : Result := Translate( tbt, 'Jal�l',    'Glory' );
  Else
    Result := Format( 'Invalid weekday number (%d)', [ BahaiDayOfWeek( bd ) ] );
  End;

End;

/////

Function BahaiWeekDayName( gd : TGDate; tbt : TBahaiText ) : String;
Begin
  Result := BahaiWeekDayName( BahaiFromGregorian( gd ), tbt );
End;

/////

Function BahaiWeekDayName( td : TDateTIme; tbt : TBahaiText ) : String;
Begin
  Result := BahaiWeekDayName( GregorianDate( td ), tbt );
End;

Function BahaiDayOrMonthName( i : Integer; tbt : TBahaiText ) : String;
Begin

  Case i Of
    1  : Result := Translate( tbt, 'Bah�',       'Splendor' );
    2  : Result := Translate( tbt, 'Jal�l',      'Glory' );
    3  : Result := Translate( tbt, 'Jam�l',      'Beauty' );
    4  : Result := Translate( tbt, '''Azamat',   'Grandeur' );
    5  : Result := Translate( tbt, 'N�r',        'Light' );
    6  : Result := Translate( tbt, 'Rahmat',     'Mercy' );
    7  : Result := Translate( tbt, 'Kalim�t',    'Words' );
    8  : Result := Translate( tbt, 'Kam�l',      'Perfection' );
    9  : Result := Translate( tbt, 'Asm�',       'Names' );
    10 : Result := Translate( tbt, '''Izzat',    'Might' );
    11 : Result := Translate( tbt, 'Mash�yyat',  'Will' );
    12 : Result := Translate( tbt, '''Ilm',      'Knowledge' );
    13 : Result := Translate( tbt, 'Qudrat',     'Power' );
    14 : Result := Translate( tbt, 'Qawl',       'Speech' );
    15 : Result := Translate( tbt, 'Mas�''il',   'Questions' );
    16 : Result := Translate( tbt, 'Sharaf',     'Honor' );
    17 : Result := Translate( tbt, 'Sult�n',     'Sovereignty' );
    18 : Result := Translate( tbt, 'Mulk',       'Dominion' );
    19 : Result := Translate( tbt, '''Al�',      'Loftiness' );
  End;

End;

/////

Function BahaiMonthName( bd : TBDate; tbt : TBahaiText ) : String;
Var
  iMonth : Integer;
Begin

  // If the "month" is really the intercalary days, return that.
  If bd.iMonth = 19 Then
    Result := Translate( tbt, 'Ayy�m-i-H�', 'Intercalary Days' )
  Else
  Begin

    // Take the intercalary days into account when asking for a month name.
    If bd.iMonth = 20 Then
      iMonth := bd.iMonth - 1
    Else
      iMonth := bd.iMonth;

    If ( iMonth > 0 ) And ( iMonth < 20 ) Then
      Result := BahaiDayOrMonthName( iMonth, tbt )
    Else
      Result := Format( 'Invalid month number (%d)', [ bd.iMonth ] );

  End;

End;

/////

Function BahaiMonthName( gd : TGDate; tbt : TBahaiText ) : String;
Begin
  Result := BahaiMonthName( BahaiFromGregorian( gd ), tbt );
End;

/////

Function BahaiMonthName( td : TDateTime; tbt : TBahaiText ) : String;
Begin
  Result := BahaiMonthName( GregorianDate( td ), tbt );
End;

/////

Function BahaiDayName( bd : TBDate; tbt : TBahaiText ) : String;
Begin

  If ( bd.iDay > 0 ) And ( bd.iDay < 20 ) Then
    Result := BahaiDayOrMonthName( bd.iDay, tbt )
  Else
    Result := Format( 'Invalid day number (%d)', [ bd.iDay ] );

End;

/////

Function BahaiDayName( gd : TGDate; tbt : TBahaiText ) : String;
Begin
  Result := BahaiDayName( BahaiFromGregorian( gd ), tbt );
End;

/////

Function BahaiDayName( td : TDateTime; tbt : TBahaiText ) : String;
Begin
  Result := BahaiDayName( GregorianDate( td ), tbt );
End;

/////

Function BahaiDayOrdinal( bd : TBDate ) : String;
Begin
  Result := IntToStr( bd.iDay ) + OrdinalSuffix( bd.iDay );
End;

/////

Function BahaiDayOrdinal( gd : TGDate ) : String;
Begin
  Result := BahaiDayOrdinal( BahaiFromGregorian( gd ) );
End;

/////

Function BahaiDayOrdinal( td : TDateTime ) : String;
Begin
  Result := BahaiDayOrdinal( GregorianDate( td ) );
End;

/////

Function BahaiYearOrCycleName( i : Integer; tbt : TBahaiText ) : String;
Begin

  Case i Of
    1  : Result := Translate( tbt, 'Alif',   'A' );
    2  : Result := Translate( tbt, 'B�',     'B' );
    3  : Result := Translate( tbt, 'Ab',     'Father' );
    4  : Result := Translate( tbt, 'D�l',    'D' );
    5  : Result := Translate( tbt, 'B�b',    'Gate' );
    6  : Result := Translate( tbt, 'V�v',    'V' );
    7  : Result := Translate( tbt, 'Abad',   'Eternity' );
    8  : Result := Translate( tbt, 'J�d',    'Generosity' );
    9  : Result := Translate( tbt, 'Bah�',   'Splendor' );
    10 : Result := Translate( tbt, 'Hubb',   'Love' );
    11 : Result := Translate( tbt, 'Bahh�j', 'Delightful' );
    12 : Result := Translate( tbt, 'Jav�b',  'Answer' );
    13 : Result := Translate( tbt, 'Ahad',   'Single' );
    14 : Result := Translate( tbt, 'Vahh�b', 'Bountiful' );
    15 : Result := Translate( tbt, 'Vid�d',  'Affection' );
    16 : Result := Translate( tbt, 'Bad�',   'Beginning' );
    17 : Result := Translate( tbt, 'Bah�',   'Luminous' );
    18 : Result := Translate( tbt, 'Abh�',   'Most Luminous' );
    19 : Result := Translate( tbt, 'V�hid',  'Unity' );
  End;

End;

/////

Function BahaiYearName( bd : TBDate; tbt : TBahaiText ) : String;
Begin

  If ( bd.iYear > 0 ) And ( bd.iYear < 20 ) Then
    Result := BahaiYearOrCycleName( bd.iYear, tbt )
  Else
    Result := Format( 'Invalid year number (%d)', [ bd.iYear ] );

End;

/////

Function BahaiYearName( gd : TGDate; tbt : TBahaiText ) : String;
Begin
  Result := BahaiYearName( BahaiFromGregorian( gd ), tbt );
End;

/////

Function BahaiYearName( td : TDateTime; tbt : TBahaiText ) : String;
Begin
  Result := BahaiYearName( GregorianDate( td ), tbt );
End;

/////

Function BahaiCycleName( bd : TBDate; tbt : TBahaiText ) : String;
Begin

  If ( bd.iCycle > 0 ) And ( bd.iCycle < 20 ) Then
    Result := BahaiYearOrCycleName( bd.iCycle, tbt )
  Else
    Result := Format( 'Invalid cycle number (%d)', [ bd.iCycle ] );

End;

/////

Function BahaiCycleName( gd : TGDate; tbt : TBahaiText ) : String;
Begin
  Result := BahaiCycleName( BahaiFromGregorian( gd ), tbt );
End;

/////

Function BahaiCycleName( td : TDateTime; tbt : TBahaiText ) : String;
Begin
  Result := BahaiCycleName( GregorianDate( td ), tbt );
End;

/////

Function BahaiMajorName( bd : TBDate ) : String;
Begin
  Result := IntToStr( bd.iMajor ) + OrdinalSuffix( bd.iMajor );
End;

/////

Function BahaiMajorName( gd : TGDate ) : String;
Begin
  Result := BahaiMajorName( BahaiFromGregorian( gd ) );
End;

/////

Function BahaiMajorName( td : TDateTime ) : String;
Begin
  Result := BahaiMajorName( GregorianDate( td ) );
End;

/////

Function IsBahaiFeastOfRidvan( gd : TGDate ) : Boolean;
Var
  fd : TFDate;
Begin

  // Get the fixed version of the date.
  fd := FixedFromGregorian( gd );

  // Is it between (Gregorian) 21st April and 2nd May inclusive?
  Result := ( fd >= FixedFromGregorian( GregorianDate( gd.iYear, 4, 21 ) ) ) And
            ( fd <= FixedFromGregorian( GregorianDate( gd.iYear, 5,  2 ) ) );

End;

/////

Function IsBahaiFeastOfRidvan( bd : TBDate ) : Boolean;
Begin
  Result := IsBahaiFeastOfRidvan( GregorianFromBahai( bd ) );
End;

/////

Function IsBahaiFeastOfRidvan( td : TDateTime ) : Boolean;
Begin
  Result := IsBahaiFeastOfRidvan( GregorianDate( td ) );
End;

/////

Function IsBahaiFeastDay( bd : TBDate ) : Boolean;
Begin
  Result := ( Not IsBahaiIntercalary( bd ) ) And ( ( bd.iDay = 1 ) Or IsBahaiFeastOfRidvan( bd ) );
End;

/////

Function IsBahaiFeastDay( gd : TGDate ) : Boolean;
Begin
  Result := IsBahaiFeastDay( BahaiFromGregorian( gd ) );
End;

/////

Function IsBahaiFeastDay( td : TDateTime ) : Boolean;
Begin
  Result := IsBahaiFeastDay( GregorianDate( td ) );
End;

/////

Function IsBahaiHolyDay( gd : TGDate ) : Boolean;
Var
  fd : TFDate;
Begin

  // Convert the date into a fixed date.
  fd := FixedFromGregorian( gd );

  // Holy day?
  Result := ( fd = BahaiNewYear( gd.iYear ) )                                Or
            ( fd = FixedFromGregorian( GregorianDate( gd.iYear,  4, 21 ) ) ) Or
            ( fd = FixedFromGregorian( GregorianDate( gd.iYear,  4, 29 ) ) ) Or
            ( fd = FixedFromGregorian( GregorianDate( gd.iYear,  5,  2 ) ) ) Or
            ( fd = FixedFromGregorian( GregorianDate( gd.iYear,  5, 23 ) ) ) Or
            ( fd = FixedFromGregorian( GregorianDate( gd.iYear,  5, 29 ) ) ) Or
            ( fd = FixedFromGregorian( GregorianDate( gd.iYear,  7,  9 ) ) ) Or
            ( fd = FixedFromGregorian( GregorianDate( gd.iYear, 10, 20 ) ) ) Or
            ( fd = FixedFromGregorian( GregorianDate( gd.iYear, 11, 12 ) ) );

End;

/////

Function IsBahaiHolyDay( bd : TBDate ) : Boolean;
Begin
  Result := IsBahaiHolyDay( GregorianFromBahai( bd ) );
End;

/////

Function IsBahaiHolyDay( td : TDateTime ) : Boolean;
Begin
  Result := IsBahaiHolyDay( GregorianDate( td ) );
End;

/////

Function IsBahaiImportantDay( gd : TGDate ) : Boolean;
Var
  fd : TFDate;
Begin

  // Convert the date into a fixed date.
  fd := FixedFromGregorian( gd );

  // Important day?
  Result := ( fd = FixedFromGregorian( GregorianDate( gd.iYear,  5, 23 ) ) ) Or
            ( fd = FixedFromGregorian( GregorianDate( gd.iYear, 11, 29 ) ) );

End;

/////

Function IsBahaiImportantDay( bd : TBDate ) : Boolean;
Begin
  Result := IsBahaiImportantDay( GregorianFromBahai( bd ) );
End;

/////

Function IsBahaiImportantDay( td : TDateTime ) : Boolean;
Begin
  Result := IsBahaiImportantDay( GregorianDate( td ) );
End;

/////

Function IsBahaiFastDay( bd : TBDate ) : Boolean;
Begin
  Result := bd.iMonth = 20;
End;

/////

Function IsBahaiFastDay( gd : TGDate ) : Boolean;
Begin
  Result := IsBahaiFastDay( BahaiFromGregorian( gd ) );
End;

/////

Function IsBahaiFastDay( td : TDateTime ) : Boolean;
Begin
  Result := IsBahaiFastDay( GregorianDate( td ) );
End;

End.

/// BahaiCalendar.pas ends here.


#
# Written By: Meghan Augusta
# Last Updated - 10/03/2023
#
#
# Basic Description:
# Automate the opening and closing of browser windows to faciliate testing bulk web pages. Random page and time generation to facilitate imitating user behavior.
# Currently only working in Microsoft Edge.
#



CLS

CD $PSScriptRoot

$COUNT = 0

$PAGE = Import-Csv example.csv | Get-Random -Count 50
$BASE = "https://example.com"

Write-Host "Randomly selecting wait time before starting automation."
$TIMEBEFORE = Get-Random -Minimum 1 -Maximum 900
$MINBEFORE = $TIMEBEFORE/60
Start-Sleep -Seconds 2

CLS
Write-Host "Waiting $MINBEFORE Minutes (or $TIMEBEFORE seconds) before starting automation."
Start-Sleep -Seconds $TIMEBEFORE

CLS
Write-Host "Starting automation."
Start-Sleep -Seconds 2

foreach($ENTRY in $PAGE)
{
    CLS

    $TIMEBETWEEN = Get-Random -Minimum 4 -Maximum 12

    $URL= $BASE + $ENTRY.Item

    Write-Host "==============================================================="
    Write-Host "Automation has run $COUNT times"
    Write-Host "Script is loading: " $URL
    start microsoft-edge:$URL
    Write-Host "==============================================================="
    $COUNT++
    start-sleep -Seconds $TIMEBETWEEN
    
}

Get-Process msedge | Stop-Process
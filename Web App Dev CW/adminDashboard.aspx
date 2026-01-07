<%@ Page Title="Dashboard" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="Admin.admin.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dashboard {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            margin: 20px;
        }

        .card {
            border: 2px solid black;
            border-radius: 8px;
            padding: 15px;
            width: 250px;
            text-align: center;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.5);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
            overflow: hidden;
            margin: 30px; 
        }

            .card:hover {
                transform: translateY(-5px);
            }

            .card h3 {
                margin: 0;
                font-size: 18px;
                font-weight: bold;
                color: #333;
            }

            .card p {
                margin: 10px 0;
                font-size: 24px;
                font-weight: bold;
            }

            .card span txt {
                font-size: 18px;
            }



        .growth {
            display: block;
            margin-top: 5px;
        }

        .chart-container {
            width: 70%;
            margin: 60px auto;
        }

        .chartTitle {
            text-align: center;
            font-weight: bold;
            font-size: 40px;
            padding-top: 50px;
        }
    </style>

    <div class="dashboard">
        <div class="card">
            <h3>Today's Sales</h3>
            <p>
                <asp:Literal ID="todaysSalesLiteral" runat="server" Text="$0"></asp:Literal>
            </p>
            <span id="salesGrowth" class="growth">
                <asp:Literal ID="salesGrowthLiteral" runat="server"></asp:Literal>
            </span>
        </div>
        <div class="card">
            <h3>Today's Orders</h3>
            <p id="todaysOrders" style="font-size: 24px; font-weight: bold;">
                <asp:Literal ID="todaysOrdersLiteral" runat="server"></asp:Literal>
            </p>
            <span id="ordersComparison" class="growth">
                <asp:Literal ID="ordersComparisonLiteral" runat="server"></asp:Literal>
            </span>
        </div>
        <div class="card">
            <h3>All Time Sales</h3>
            <p>
                <asp:Literal ID="totalSalesAllTimeLiteral" runat="server" Text="$0"></asp:Literal>
            </p>
            <div class="txt">
                Every sale reflects trust and value.
           
            </div>
        </div>
        <div class="card">
            <h3>Total Users</h3>
            <p>
                <asp:Literal ID="totalUsersLiteral" runat="server" Text="0"></asp:Literal>
            </p>
        </div>
    </div>

    <div class="chartTitle">
        Pineapple Store's Monthly Sales
    
    </div>
    <div class="chart-container">
        <canvas id="monthlySalesChart"></canvas>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const ctx = document.getElementById('monthlySalesChart').getContext('2d');
            const salesData = window.salesData || {};


            const months = Object.keys(salesData);
            const products = [...new Set(Object.values(salesData).flatMap(obj => Object.keys(obj)))];

            const datasets = products.map(product => {
                return {
                    label: product,
                    data: months.map(month => salesData[month][product] || 0),
                    borderColor: getRandomColor(),
                    borderWidth: 2,
                    fill: false
                };
            });

         
            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: months, 
                    datasets: datasets 
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: { position: 'top' },
                        tooltip: { mode: 'index', intersect: false }
                    },
                    scales: {
                        x: { title: { display: true, text: 'Month' } },
                        y: { title: { display: true, text: 'Sales (RM)' } }
                    }
                }
            });

         
            function getRandomColor() {
                const letters = '0123456789ABCDEF';
                let color = '#';
                for (let i = 0; i < 6; i++) {
                    color += letters[Math.floor(Math.random() * 16)];
                }
                return color;
            }
        });

        const cards = document.querySelectorAll('.card');

        cards.forEach(card => {
            card.addEventListener('mouseenter', () => {
                const randomColor = `rgba(${Math.floor(Math.random() * 256)}, 
                               ${Math.floor(Math.random() * 256)}, 
                               ${Math.floor(Math.random() * 256)}, 0.8)`; 
                card.style.boxShadow = `0 16px 32px ${randomColor}`; 
            });

            card.addEventListener('mouseleave', () => {
                card.style.boxShadow = '0 12px 24px rgba(0, 0, 0, 0.5)'; 
            });
        });
    </script>

</asp:Content>

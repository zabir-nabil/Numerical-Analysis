

#include <bits/stdc++.h>


#define loop(i,s,e) for(int i = s;i<=e;i++) //including end point

#define pb(a) push_back(a)

#define read() freopen("data.txt", "r", stdin)

#define write() freopen("output.txt", "w", stdout)

#define dd double

#define ll long long

#define D(v,status) cout<<status<<" "<<v<<endl;

#define Dso(v) cout<<v;

#define INF 1000000000   //10e9

#define EPS 1e-9

using namespace std;

vector<double> tempdata;

int main()
{
    read();
    write();
    string date, time;
    ll epoch, remoteid;
    dd temperature, humidity, light,
    voltage;

    while(cin>>date>>time>>
            epoch>>remoteid
            >>temperature>>humidity>>
            light>>voltage)
    {

        //currently working with temperature only



        tempdata.pb(temperature);

    }




    dd t0,t1,t2,t3;

    dd h = 0.01;




    t0 = tempdata[0];
    t1 = tempdata[1];
    t2 = tempdata[2];
    t3 = tempdata[3];

    dd threshold[10];

    threshold[1] = 0.21;
    for(int i=2; i<=7; i++)
    {
        threshold[i] = threshold[i-1] + 0.03;

    }


    cout<<"h    % of successful prediction (delta = 0.21)"<<endl;
    for(int hcr=1; hcr<=9; hcr++)
    {

        int ccase = 0, wcase = 0;

        for(int i=4; i<tempdata.size(); i++)
        {
            dd yp = t0 + (4.00/3.00)*h*(

                        2*t1 - t2  +2*t3);
            dd yc = t2 + h*(t2+4*t3+yp)/3.00;
            yc = t2 + h*(t2+4*t3+yc)/3.00;

            if(fabs(yc-tempdata[i])<=threshold[1])
            {
                ccase++;
            }
            else
            {
                //       cout<<yc<<" "<<tempdata[i]<<endl;

                wcase++;
            }

            t0 = tempdata[i-3];
            t1 = tempdata[i-2];
            t2 = tempdata[i-1];
            t3 = tempdata[i];





        }
        //cout<<"Threshold "<<threshold[thr]<<endl;;
        //Dso("Percentage of correct case : ");
        Dso(h);
        Dso("    ");
        Dso((ccase*100.00)/(ccase+wcase));
        Dso(endl);

        h/=10.000000;


    }








    return 0;
}

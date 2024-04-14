#include "history.hpp"

int main()
{
    string YEAR, MONTH, DAY, TIME, USERNAME, PROJECT;

    cout << "Welcome to use Github History commit.\n";
    
    cout << "Press Year when you want to commit.\n";
    getline(cin, YEAR);
    
    cout << "Press Month when you want to commit.\n";
    getline(cin, MONTH);
    
    cout << "Press Day when you want to commit.\n";
    getline(cin, DAY);
    
    cout << "Press Total Time when you want to commit.\n";
    getline(cin, TIME);
    
    cout << "Who are you？\n";
    getline(cin, USERNAME);
    
    cout << "Press repository name when you want to commit.\n";
    getline(cin, PROJECT);

    system(("git clone https://github.com/" + USERNAME + "/" + PROJECT + " --depth=1 source").c_str());
    system("cd source");
    system("touch .testfile");
    system("git add .");
    system(("GIT_AUTHOR_DATE=" + YEAR + "-" + MONTH + "-" + DAY + "T" + TIME + " GIT_COMMITTER_DATE=" + YEAR + "-" + MONTH + "-" + DAY + "T" + TIME + " git commit -m " + YEAR).c_str());
    system("git push -u origin HEAD -f");
    system("cd ..");
    system("rm -rf source");

    cout << "Congratulation! Check your repository now: https://github.com/" + USERNAME + "/" + PROJECT + "/commit\n";
    
    return 0;
}

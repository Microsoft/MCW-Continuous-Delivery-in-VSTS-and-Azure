![Microsoft Cloud Workshops](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/main/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
Continuous delivery in Azure DevOps
</div>

<div class="MCWHeader2">
Before the hands-on lab setup guide
</div>

<div class="MCWHeader3">
June 2021
</div>


Information in this document, including URL and other Internet website references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third-party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

© 2021 Microsoft Corporation. All rights reserved.

Microsoft and the trademarks listed at <https://www.microsoft.com/en-us/legal/intellectualproperty/Trademarks/Usage/General.aspx> are trademarks of the Microsoft group of companies. All other trademarks are property of their respective owners.

**Contents**

<!-- TOC -->

- [Continuous Delivery - before the hands-on lab setup guide](#continuous-delivery---before-the-hands-on-lab-setup-guide)
  - [Requirements](#requirements)
  - [Before the hands-on lab](#before-the-hands-on-lab)
    - [Task 1: Create the Project Repo](#task-1-create-the-project-repo)
    - [Task 2: Create GitHub Personal Access Token](#task-2-create-github-personal-access-token)
    - [Task 3: Create Azure DevOps Personal Access Token](#task-3-create-azure-devops-personal-access-token)
    - [Task  4: Create Azure DevOps Project](#task--4-create-azure-devops-project)

<!-- /TOC -->

# Continuous Delivery - before the hands-on lab setup guide 

## Requirements

1. Microsoft Azure subscription must be pay-as-you-go or MSDN.

- Trial subscriptions will _not_ work

  - To complete this lab setup, ensure your account includes the following:

    - Has the [Owner](https://docs.microsoft.com/azure/role-based-access-control/build-in-roles#owner) built-in role for the subscription you use.

    - Is a [Member](https://docs.microsoft.com/azure/active-directory/fundamentals/users-default-permissions#member-and-guest-users) user in the Azure AD tenant you use. (Guest users will not have the necessary permissions.)

2. A Microsoft [GitHub](https://github.com) account.

3. Local machine or a virtual machine configured with:

    - A browser, preferably Chrome for consistency with the lab implementation tests.

4. Git for Windows

5. PowerShell

## Before the hands-on lab

Duration: 60 minutes

You should follow all of the steps provided in this section _before_ taking part in the hands-on lab ahead of time.

### Task 1: Create the Project Repo

In this task, you will create an account in [GitHub](https://github.com) and use `git` to add lab files to a new repository.

1. Create a new repository in GitHub for the lab files.

    - Browse to [GitHub](https://github.com) in your browser and log into your account.

    - Create a new repository.

      - Click on the `New` button.

        ![The `New Repository` button in a GitHub profile.](../Media/b4-task1-step1-1.png "New Repository Button")

      - Provide a name and description for your new repository.

        > **Note**: Suggested name for the repository is `mcw-continuous-delivery-lab-files`.

        ![The `New Repository` creation form in GitHub.](../Media/b4-task1-step1-2.png "New Repository Creation Form")

      - Click on the `Create Repository` button to create the new repository.

        ![The created repository in GitHub. This should reflect the repository that was created.](../Media/b4-task1-step1-3.png "Created Repository Page")

2. Clone the lab repository.

- Create an appropriate workspace folder and navigate to it in a PowerShell terminal.

 > **Note**: Suggested name for the workspace folder is `C:\Workspaces\lab`, for example.

 ```pwsh
 C:
 mkdir C:\Workspaces
 cd C:\Workspaces
 mkdir lab
 cd lab
 ```

- Type the following command and press `<ENTER>`:

 ```pwsh
 git clone https://github.com/solliancenet/microsoft-mcw-continuous-delivery.git
 ```

- Create a folder for the GitHub repository created in Step 1 and navigate to it in PowerShell.

 ```pwsh
 mkdir mcw-continuous-delivery-lab-files
 cd mcw-continuous-delivery-lab-files
 ```

- Copy lab files from the MCW lab repository to the new folder.

 ```pwsh
 Copy-Item '..\microsoft-mcw-continuous-delivery\Hands-on lab\lab-files\*' -Destination ./ -Recurse
 ```

- Initialize folder as a git repository, commit, and submit contents to remote GitHub branch `main` in the lab files repository created in Step 1.

 > **Note**: The URI of the lab files GitHub repository created in Step 1 will differ from that in the example below.

 ```pwsh
 git init
 git add .
 git commit -m "Initial commit"
 git branch -M main
 git remote add origin https://github.com/hatboyzero/mcw-continuous-delivery-lab-files.git
 git push -u origin main
 ```

### Task 2: Create GitHub Personal Access Token

1. Log in to your GitHub account.

2. Create a Personal Access Token as [described here](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/creating-a-personal-access-token).  Ensure that the following scopes are checked when configuring your GitHub Personal Access Token.

    - `repo` - Full control of private repositories
    - `workflow` - Update GitHub Action workflows
    - `write:packages` - Upload packages to GitHub Package Registry
    - `delete:packages` - Delete packages from GitHub Package Registry
    - `read:org` - Read org and team membership, read org projects

    ![The configured scopes for a GitHub Personal Access Token.](../Media/b4-task2-step2-1.png "GitHub Personal Access Token Scope Configuration")

3. Copy the GitHub Personal Access Token somewhere safe and accessible for later use during the lab. **DO NOT COMMIT THIS VALUE TO YOUR REPO!**

    ![The GitHub Personal Access Token. This is a secret value that should be stored somewhere safe and accessible.](../Media/b4-task2-step3-1.png "Created GitHub Personal Access Token")

### Task 3: Create Azure DevOps Personal Access Token

1. Log in to your existing Azure DevOps account or create a new account on https://dev.azure.com.

    ![The Azure DevOps Portal.](../Media/b4-task3-step1-1.png "Azure DevOps Portal")

2. Create an Azure DevOps Personal Access Token as [described here](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=preview-page).  For this lab, please ensure your Azure DevOps Personal Access Token is configured with a `Full access` scope.

    > **Note**: A `Full access` scope is not recommended for Azure DevOps Personal Access Tokens in live development and production environments. We are only using this scope for this lab.

    ![The Azure DevOps Create Personal Access Token Form.](../Media/b4-task3-step2-1.png "Create Azure DevOps Personal Access Token")

3. Copy the Azure DevOps Personal Access Token somewhere safe and accessible to you for later use during the lab. **DO NOT COMMIT THIS VALUE TO YOUR REPO!**

    ![The Azure DevOps Personal Access Token created in the previous step.](../Media/b4-task3-step3-1.png "Created Azure DevOps Personal Access Token")

### Task  4: Create Azure DevOps Project

1. Create a `Fabrikam` project in Azure DevOps for use in the lab.

2. (Optional) To complete Exercise 3: Task 3 in the Hands on Lab, the student will need to request a free grant of parallel jobs in Azure Pipelines via [this form](https://aka.ms/azpipelines-parallelism-request). More information can be found [here regarding changes in Azure Pipelines Grant for Public Projects](https://devblogs.microsoft.com/devops/change-in-azure-pipelines-grant-for-public-projects/)

You should follow all steps provided *before* performing the Hands-on lab.

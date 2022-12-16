# Helm charts releaser
Github pages with automated Helm charts releaser

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

  helm repo add https://feraudt.github.io/helm-charts-releaser

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
<alias>` to see the charts.

To install the <chart-name> chart:

    helm install wordpress-mysql-release-name ./wordpress-mysql-chart-x.x.x.tgz

To uninstall the chart:

    helm delete wordpress-mysql-chart

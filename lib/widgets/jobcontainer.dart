import 'package:flutter/material.dart';
import 'package:wellancer/screens/details.dart';

class JobContainer extends StatelessWidget {
  final String title, enterprise, description, initialFunding;
  final Function() onTap;

  const JobContainer({
    super.key,
    required this.title,
    required this.enterprise,
    required this.description,
    required this.initialFunding,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => DetailsScreen(
            id: 0, // Replace with the appropriate ID value
            title: title,
            enterprise: enterprise,
            description: description,
            initialFunding: initialFunding,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5.0,
                offset: Offset(0, 3))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    "https://cdn0.iconfinder.com/data/icons/job-seeker/256/location_job_seeker_employee_unemployee_work-512.png",
                    height: 71,
                    width: 71,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$title",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "$enterprise",
                        style: Theme.of(context).textTheme.titleSmall?.apply(
                              color: Colors.grey,
                            ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Text(
              "$description",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.apply(color: Colors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 9),
            Text(
              "${initialFunding} VND",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.apply(fontWeightDelta: 2),
            )
          ],
        ),
      ),
    );
  }
}

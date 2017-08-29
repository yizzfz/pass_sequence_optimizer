; ModuleID = 'A.ll'
source_filename = "seidel-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_seidel_2d(i32 500, i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %._crit_edge.preheader.lr.ph, label %.._crit_edge4_crit_edge

.._crit_edge4_crit_edge:                          ; preds = %2
  br label %._crit_edge4

._crit_edge.preheader.lr.ph:                      ; preds = %2
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.lr.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge._crit_edge.us ], [ 0, %._crit_edge.preheader.lr.ph ]
  %3 = trunc i64 %indvars.iv5 to i32
  %4 = sitofp i32 %3 to double
  br i1 true, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.preheader.us
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %._crit_edge.us.prol, %._crit_edge.preheader.us
  br i1 false, label %._crit_edge.us.prol.loopexit.._crit_edge._crit_edge.us_crit_edge, label %._crit_edge.us.preheader

._crit_edge.us.prol.loopexit.._crit_edge._crit_edge.us_crit_edge: ; preds = %._crit_edge.us.prol.loopexit
  br label %._crit_edge._crit_edge.us

._crit_edge.us.preheader:                         ; preds = %._crit_edge.us.prol.loopexit
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %5, %._crit_edge.us ], [ 0, %._crit_edge.us.preheader ]
  %5 = add nuw nsw i64 %indvars.iv, 2
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = fmul double %4, %7
  %9 = fadd double %8, 2.000000e+00
  %10 = fdiv double %9, 2.000000e+03
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %10, double* %11, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = add nsw i64 %indvars.iv, 3
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fmul double %4, %14
  %16 = fadd double %15, 2.000000e+00
  %17 = fdiv double %16, 2.000000e+03
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %exitcond9.1 = icmp eq i64 %5, 2000
  br i1 %exitcond9.1, label %._crit_edge._crit_edge.us.loopexit, label %._crit_edge.us

._crit_edge._crit_edge.us.loopexit:               ; preds = %._crit_edge.us
  br label %._crit_edge._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us.prol.loopexit.._crit_edge._crit_edge.us_crit_edge, %._crit_edge._crit_edge.us.loopexit
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 2000
  br i1 %exitcond, label %._crit_edge4.loopexit, label %._crit_edge.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %.._crit_edge4_crit_edge, %._crit_edge4.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d(i32, i32, [2000 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %._crit_edge.preheader.lr.ph, label %.._crit_edge7_crit_edge

.._crit_edge7_crit_edge:                          ; preds = %3
  br label %._crit_edge7

._crit_edge.preheader.lr.ph:                      ; preds = %3
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge._crit_edge, %._crit_edge.preheader.lr.ph
  %.026 = phi i32 [ 0, %._crit_edge.preheader.lr.ph ], [ %27, %._crit_edge._crit_edge ]
  br i1 false, label %._crit_edge.preheader.._crit_edge._crit_edge_crit_edge, label %._crit_edge3.preheader.preheader

._crit_edge.preheader.._crit_edge._crit_edge_crit_edge: ; preds = %._crit_edge.preheader
  br label %._crit_edge._crit_edge

._crit_edge3.preheader.preheader:                 ; preds = %._crit_edge.preheader
  br label %._crit_edge3.preheader

._crit_edge3.preheader:                           ; preds = %._crit_edge3.preheader.preheader, %._crit_edge
  %indvar = phi i64 [ %4, %._crit_edge ], [ 0, %._crit_edge3.preheader.preheader ]
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge ], [ 1, %._crit_edge3.preheader.preheader ]
  %4 = add i64 %indvar, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %4, i64 0
  %5 = add nsw i64 %indvars.iv8, -1
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %load_initial = load double, double* %scevgep, align 8
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 0
  %.pre = load double, double* %.phi.trans.insert, align 8
  %.phi.trans.insert14 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 1
  %.pre15 = load double, double* %.phi.trans.insert14, align 8
  %.phi.trans.insert16 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv8, i64 1
  %.pre17 = load double, double* %.phi.trans.insert16, align 8
  %.phi.trans.insert18 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next9, i64 0
  %.pre19 = load double, double* %.phi.trans.insert18, align 8
  %.phi.trans.insert20 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next9, i64 1
  %.pre21 = load double, double* %.phi.trans.insert20, align 8
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.preheader, %._crit_edge3
  %6 = phi double [ %.pre21, %._crit_edge3.preheader ], [ %24, %._crit_edge3 ]
  %7 = phi double [ %.pre19, %._crit_edge3.preheader ], [ %6, %._crit_edge3 ]
  %8 = phi double [ %.pre17, %._crit_edge3.preheader ], [ %19, %._crit_edge3 ]
  %9 = phi double [ %.pre15, %._crit_edge3.preheader ], [ %13, %._crit_edge3 ]
  %10 = phi double [ %.pre, %._crit_edge3.preheader ], [ %9, %._crit_edge3 ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge3.preheader ], [ %26, %._crit_edge3 ]
  %indvars.iv = phi i64 [ 1, %._crit_edge3.preheader ], [ %indvars.iv.next, %._crit_edge3 ]
  %11 = fadd double %10, %9
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 %indvars.iv.next
  %13 = load double, double* %12, align 8
  %14 = fadd double %11, %13
  %15 = fadd double %14, %store_forwarded
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv
  %17 = fadd double %15, %8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv.next
  %19 = load double, double* %18, align 8
  %20 = fadd double %17, %19
  %21 = fadd double %20, %7
  %22 = fadd double %21, %6
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next9, i64 %indvars.iv.next
  %24 = load double, double* %23, align 8
  %25 = fadd double %22, %24
  %26 = fdiv double %25, 9.000000e+00
  store double %26, double* %16, align 8
  %exitcond13 = icmp eq i64 %indvars.iv.next, 1999
  br i1 %exitcond13, label %._crit_edge, label %._crit_edge3

._crit_edge:                                      ; preds = %._crit_edge3
  %exitcond11 = icmp eq i64 %indvars.iv.next9, 1999
  br i1 %exitcond11, label %._crit_edge._crit_edge.loopexit, label %._crit_edge3.preheader

._crit_edge._crit_edge.loopexit:                  ; preds = %._crit_edge
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge.preheader.._crit_edge._crit_edge_crit_edge, %._crit_edge._crit_edge.loopexit
  %27 = add nuw nsw i32 %.026, 1
  %exitcond12 = icmp eq i32 %27, 500
  br i1 %exitcond12, label %._crit_edge7.loopexit, label %._crit_edge.preheader

._crit_edge7.loopexit:                            ; preds = %._crit_edge._crit_edge
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %.._crit_edge7_crit_edge, %._crit_edge7.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %._crit_edge.preheader.us.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

._crit_edge.preheader.us.preheader:               ; preds = %2
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv5, 2000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge2.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge2.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond9, label %._crit_edge._crit_edge.us, label %8

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %._crit_edge.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

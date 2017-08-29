; ModuleID = 'A.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = bitcast i8* %3 to [2000 x double]*
  %7 = bitcast i8* %4 to double*
  %8 = bitcast i8* %5 to double*
  tail call fastcc void @init_array([2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_trisolv([2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %10
  br label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(double* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph2:
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge5..lr.ph_crit_edge, %.lr.ph2
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge5..lr.ph_crit_edge ], [ 0, %.lr.ph2 ]
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge5..lr.ph_crit_edge ], [ 1, %.lr.ph2 ]
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %3 = getelementptr inbounds double, double* %1, i64 %indvars.iv12
  store double -9.990000e+02, double* %3, align 8
  %4 = trunc i64 %indvars.iv12 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv12
  store double %5, double* %6, align 8
  %7 = add i32 %4, 2001
  %xtraiter15 = and i64 %indvars.iv.next13, 1
  %lcmp.mod = icmp eq i64 %xtraiter15, 0
  br i1 %lcmp.mod, label %.lr.ph.._crit_edge6.prol.loopexit_crit_edge, label %._crit_edge6.prol

.lr.ph.._crit_edge6.prol.loopexit_crit_edge:      ; preds = %.lr.ph
  br label %._crit_edge6.prol.loopexit

._crit_edge6.prol:                                ; preds = %.lr.ph
  %8 = sitofp i32 %7 to double
  %9 = fmul double %8, 2.000000e+00
  %10 = fdiv double %9, 2.000000e+03
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv12, i64 0
  store double %10, double* %11, align 8
  br label %._crit_edge6.prol.loopexit

._crit_edge6.prol.loopexit:                       ; preds = %.lr.ph.._crit_edge6.prol.loopexit_crit_edge, %._crit_edge6.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge6.prol ], [ 0, %.lr.ph.._crit_edge6.prol.loopexit_crit_edge ]
  %12 = icmp eq i64 %indvars.iv12, 0
  br i1 %12, label %._crit_edge6.prol.loopexit.._crit_edge5_crit_edge, label %._crit_edge6.preheader

._crit_edge6.prol.loopexit.._crit_edge5_crit_edge: ; preds = %._crit_edge6.prol.loopexit
  br label %._crit_edge5

._crit_edge6.preheader:                           ; preds = %._crit_edge6.prol.loopexit
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.._crit_edge6_crit_edge, %._crit_edge6.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge6.._crit_edge6_crit_edge ], [ %indvars.iv.unr.ph, %._crit_edge6.preheader ]
  %13 = trunc i64 %indvars.iv to i32
  %14 = sub i32 %7, %13
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv12, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = trunc i64 %indvars.iv.next to i32
  %18 = sub i32 %7, %17
  %19 = sitofp i32 %18 to double
  %20 = insertelement <2 x double> undef, double %15, i32 0
  %21 = insertelement <2 x double> %20, double %19, i32 1
  %22 = fmul <2 x double> %21, <double 2.000000e+00, double 2.000000e+00>
  %23 = fdiv <2 x double> %22, <double 2.000000e+03, double 2.000000e+03>
  %24 = bitcast double* %16 to <2 x double>*
  store <2 x double> %23, <2 x double>* %24, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv10
  br i1 %exitcond.1, label %._crit_edge5.loopexit, label %._crit_edge6.._crit_edge6_crit_edge

._crit_edge6.._crit_edge6_crit_edge:              ; preds = %._crit_edge6
  br label %._crit_edge6

._crit_edge5.loopexit:                            ; preds = %._crit_edge6
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge6.prol.loopexit.._crit_edge5_crit_edge, %._crit_edge5.loopexit
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond16, label %._crit_edge4, label %._crit_edge5..lr.ph_crit_edge

._crit_edge5..lr.ph_crit_edge:                    ; preds = %._crit_edge5
  br label %.lr.ph

._crit_edge4:                                     ; preds = %._crit_edge5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv([2000 x double]* nocapture readonly, double*, double* nocapture readonly) unnamed_addr #2 {
.lr.ph9:
  %sunkaddr4 = ptrtoint double* %1 to i64
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge12.._crit_edge14_crit_edge, %.lr.ph9
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge12.._crit_edge14_crit_edge ], [ 0, %.lr.ph9 ]
  %3 = add nuw nsw i64 %indvars.iv21, 4294967295
  %4 = getelementptr inbounds double, double* %2, i64 %indvars.iv21
  %5 = load double, double* %4, align 8
  %6 = getelementptr inbounds double, double* %1, i64 %indvars.iv21
  store double %5, double* %6, align 8
  %7 = icmp sgt i64 %indvars.iv21, 0
  %sunkaddr1 = shl nsw i64 %indvars.iv21, 3
  %sunkaddr2 = add i64 %sunkaddr4, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  br i1 %7, label %.lr.ph, label %._crit_edge14.._crit_edge12_crit_edge

._crit_edge14.._crit_edge12_crit_edge:            ; preds = %._crit_edge14
  br label %._crit_edge12

.lr.ph:                                           ; preds = %._crit_edge14
  %xtraiter24 = and i64 %indvars.iv21, 1
  %lcmp.mod = icmp eq i64 %xtraiter24, 0
  br i1 %lcmp.mod, label %.lr.ph.._crit_edge13.prol.loopexit_crit_edge, label %._crit_edge13.prol

.lr.ph.._crit_edge13.prol.loopexit_crit_edge:     ; preds = %.lr.ph
  br label %._crit_edge13.prol.loopexit

._crit_edge13.prol:                               ; preds = %.lr.ph
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 0
  %9 = load double, double* %8, align 8
  %10 = load double, double* %1, align 8
  %11 = fmul double %9, %10
  %12 = fsub double %5, %11
  store double %12, double* %sunkaddr3, align 8
  br label %._crit_edge13.prol.loopexit

._crit_edge13.prol.loopexit:                      ; preds = %.lr.ph.._crit_edge13.prol.loopexit_crit_edge, %._crit_edge13.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge13.prol ], [ 0, %.lr.ph.._crit_edge13.prol.loopexit_crit_edge ]
  %.unr.ph = phi double [ %12, %._crit_edge13.prol ], [ %5, %.lr.ph.._crit_edge13.prol.loopexit_crit_edge ]
  %.lcssa16.unr.ph = phi double [ %12, %._crit_edge13.prol ], [ undef, %.lr.ph.._crit_edge13.prol.loopexit_crit_edge ]
  %13 = trunc i64 %3 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %._crit_edge13.prol.loopexit.._crit_edge12_crit_edge, label %._crit_edge13.preheader

._crit_edge13.prol.loopexit.._crit_edge12_crit_edge: ; preds = %._crit_edge13.prol.loopexit
  br label %._crit_edge12

._crit_edge13.preheader:                          ; preds = %._crit_edge13.prol.loopexit
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.._crit_edge13_crit_edge, %._crit_edge13.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge13.._crit_edge13_crit_edge ], [ %indvars.iv.unr.ph, %._crit_edge13.preheader ]
  %15 = phi double [ %27, %._crit_edge13.._crit_edge13_crit_edge ], [ %.unr.ph, %._crit_edge13.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %15, %20
  store double %21, double* %sunkaddr3, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv.next
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %sunkaddr3, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv21
  br i1 %exitcond.1, label %._crit_edge12.loopexit, label %._crit_edge13.._crit_edge13_crit_edge

._crit_edge13.._crit_edge13_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge13

._crit_edge12.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge13.prol.loopexit.._crit_edge12_crit_edge, %._crit_edge14.._crit_edge12_crit_edge, %._crit_edge12.loopexit
  %.lcssa = phi double [ %.lcssa16.unr.ph, %._crit_edge13.prol.loopexit.._crit_edge12_crit_edge ], [ %5, %._crit_edge14.._crit_edge12_crit_edge ], [ %27, %._crit_edge12.loopexit ]
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv21
  %29 = load double, double* %28, align 8
  %30 = fdiv double %.lcssa, %29
  store double %30, double* %sunkaddr3, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond26, label %._crit_edge11, label %._crit_edge12.._crit_edge14_crit_edge

._crit_edge12.._crit_edge14_crit_edge:            ; preds = %._crit_edge12
  br label %._crit_edge14

._crit_edge11:                                    ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %._crit_edge..lr.ph_crit_edge ]
  %6 = phi %struct._IO_FILE* [ %5, %.lr.ph.preheader ], [ %15, %._crit_edge..lr.ph_crit_edge ]
  %7 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %8) #6
  %10 = trunc i64 %indvars.iv to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.lr.ph.._crit_edge_crit_edge

.lr.ph.._crit_edge_crit_edge:                     ; preds = %.lr.ph
  br label %._crit_edge

; <label>:13:                                     ; preds = %.lr.ph
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.._crit_edge_crit_edge, %13
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond7 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond7, label %._crit_edge3, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  br label %.lr.ph

._crit_edge3:                                     ; preds = %._crit_edge
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

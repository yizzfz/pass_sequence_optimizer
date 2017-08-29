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
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_trisolv(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 2000, double* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph2:
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph2, %._crit_edge
  %indvars.iv8 = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next9, %._crit_edge ]
  %indvars.iv6 = phi i64 [ 1, %.lr.ph2 ], [ %indvars.iv.next7, %._crit_edge ]
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %4 = getelementptr inbounds double, double* %2, i64 %indvars.iv8
  store double -9.990000e+02, double* %4, align 8
  %5 = trunc i64 %indvars.iv8 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv8
  store double %6, double* %7, align 8
  %8 = add i32 %5, 2001
  %xtraiter11 = and i64 %indvars.iv.next9, 1
  %lcmp.mod = icmp eq i64 %xtraiter11, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %9 = sitofp i32 %8 to double
  %10 = fmul double %9, 2.000000e+00
  %11 = fdiv double %10, 2.000000e+03
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8, i64 0
  store double %11, double* %12, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %13 = icmp eq i64 %indvars.iv8, 0
  br i1 %13, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %14 = trunc i64 %indvars.iv to i32
  %15 = sub i32 %8, %14
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = trunc i64 %indvars.iv.next to i32
  %19 = sub i32 %8, %18
  %20 = sitofp i32 %19 to double
  %21 = insertelement <2 x double> undef, double %16, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  %23 = fmul <2 x double> %22, <double 2.000000e+00, double 2.000000e+00>
  %24 = fdiv <2 x double> %23, <double 2.000000e+03, double 2.000000e+03>
  %25 = bitcast double* %17 to <2 x double>*
  store <2 x double> %24, <2 x double>* %25, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv6
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond12, label %._crit_edge3, label %.lr.ph

._crit_edge3:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]* nocapture readonly, double*, double* nocapture readonly) unnamed_addr #2 {
.lr.ph9:
  %sunkaddr = ptrtoint double* %2 to i64
  br label %4

; <label>:4:                                      ; preds = %._crit_edge, %.lr.ph9
  %indvars.iv20 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next21, %._crit_edge ]
  %5 = add nuw nsw i64 %indvars.iv20, 4294967295
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv20
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds double, double* %2, i64 %indvars.iv20
  store double %7, double* %8, align 8
  %9 = icmp sgt i64 %indvars.iv20, 0
  br i1 %9, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %4
  %xtraiter23 = and i64 %indvars.iv20, 1
  %lcmp.mod = icmp eq i64 %xtraiter23, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 0
  %11 = load double, double* %10, align 8
  %12 = load double, double* %2, align 8
  %13 = fmul double %11, %12
  %14 = fsub double %7, %13
  %sunkaddr12.prol = shl nsw i64 %indvars.iv20, 3
  %sunkaddr13.prol = add i64 %sunkaddr, %sunkaddr12.prol
  %sunkaddr14.prol = inttoptr i64 %sunkaddr13.prol to double*
  store double %14, double* %sunkaddr14.prol, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %14, %.prol.preheader ], [ %7, %.lr.ph ]
  %.lcssa15.unr.ph = phi double [ %14, %.prol.preheader ], [ undef, %.lr.ph ]
  %15 = trunc i64 %5 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr12 = shl nsw i64 %indvars.iv20, 3
  %sunkaddr13 = add i64 %sunkaddr, %sunkaddr12
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to double*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %17 = phi double [ %29, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %sunkaddr14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv.next
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %sunkaddr14, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv20
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %4
  %.lcssa = phi double [ %7, %4 ], [ %.lcssa15.unr.ph, %.prol.loopexit ], [ %29, %._crit_edge.loopexit ]
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv20
  %31 = load double, double* %30, align 8
  %32 = fdiv double %.lcssa, %31
  %sunkaddr5 = shl nsw i64 %indvars.iv20, 3
  %sunkaddr6 = add i64 %sunkaddr, %sunkaddr5
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  store double %32, double* %sunkaddr7, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next21, 2000
  br i1 %exitcond25, label %._crit_edge10, label %4

._crit_edge10:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = phi %struct._IO_FILE* [ %6, %.lr.ph.preheader ], [ %16, %._crit_edge ]
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %9) #6
  %11 = trunc i64 %indvars.iv to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %.lr.ph
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond6 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond6, label %._crit_edge2, label %.lr.ph

._crit_edge2:                                     ; preds = %._crit_edge
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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

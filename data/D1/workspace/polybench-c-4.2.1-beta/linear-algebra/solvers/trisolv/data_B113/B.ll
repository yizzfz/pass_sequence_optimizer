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
  %14 = bitcast i8* %4 to double*
  tail call fastcc void @print_array(double* %14)
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
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %3
  %indvars.iv411 = phi i64 [ 1, %3 ], [ %indvars.iv411.be, %.backedge.backedge ]
  %indvars.iv610 = phi i64 [ 0, %3 ], [ %indvars.iv610.be, %.backedge.backedge ]
  %4 = getelementptr inbounds double, double* %1, i64 %indvars.iv610
  store double -9.990000e+02, double* %4, align 8
  %5 = trunc i64 %indvars.iv610 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds double, double* %2, i64 %indvars.iv610
  store double %6, double* %7, align 8
  %8 = add nuw nsw i64 %indvars.iv610, 2001
  %9 = and i64 %indvars.iv610, 1
  %lcmp.mod = icmp eq i64 %9, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.backedge..prol.loopexit_crit_edge

.backedge..prol.loopexit_crit_edge:               ; preds = %.backedge
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.backedge
  %10 = trunc i64 %8 to i32
  %11 = sitofp i32 %10 to double
  %12 = fmul double %11, 2.000000e+00
  %13 = fdiv double %12, 2.000000e+03
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv610, i64 0
  store double %13, double* %14, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.backedge..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv9.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.backedge..prol.loopexit_crit_edge ]
  %15 = icmp eq i64 %indvars.iv610, 0
  br i1 %15, label %.prol.loopexit..backedge.backedge_crit_edge, label %.prol.loopexit..new_crit_edge

.prol.loopexit..new_crit_edge:                    ; preds = %.prol.loopexit
  br label %.new

.prol.loopexit..backedge.backedge_crit_edge:      ; preds = %.prol.loopexit
  br label %.backedge.backedge

.new:                                             ; preds = %.new..new_crit_edge, %.prol.loopexit..new_crit_edge
  %indvars.iv9 = phi i64 [ %indvars.iv.next.1, %.new..new_crit_edge ], [ %indvars.iv9.unr.ph, %.prol.loopexit..new_crit_edge ]
  %16 = sub nuw nsw i64 %8, %indvars.iv9
  %17 = trunc i64 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv610, i64 %indvars.iv9
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %20 = sub nuw nsw i64 %8, %indvars.iv.next
  %21 = trunc i64 %20 to i32
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %18, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = fmul <2 x double> %24, <double 2.000000e+00, double 2.000000e+00>
  %26 = fdiv <2 x double> %25, <double 2.000000e+03, double 2.000000e+03>
  %27 = bitcast double* %19 to <2 x double>*
  store <2 x double> %26, <2 x double>* %27, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv9, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv411
  br i1 %exitcond.1, label %.unr-lcssa, label %.new..new_crit_edge

.new..new_crit_edge:                              ; preds = %.new
  br label %.new

.unr-lcssa:                                       ; preds = %.new
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv610, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 2000
  br i1 %exitcond8, label %28, label %.unr-lcssa..backedge.backedge_crit_edge

.unr-lcssa..backedge.backedge_crit_edge:          ; preds = %.unr-lcssa
  br label %.backedge.backedge

.backedge.backedge:                               ; preds = %.unr-lcssa..backedge.backedge_crit_edge, %.prol.loopexit..backedge.backedge_crit_edge
  %indvars.iv610.be = phi i64 [ %indvars.iv.next7, %.unr-lcssa..backedge.backedge_crit_edge ], [ 1, %.prol.loopexit..backedge.backedge_crit_edge ]
  %indvars.iv411.be = add nuw nsw i64 %indvars.iv411, 1
  br label %.backedge

; <label>:28:                                     ; preds = %.unr-lcssa
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv([2000 x double]* nocapture readonly, double*, double* nocapture readonly) unnamed_addr #2 {
  %sunkaddr14 = ptrtoint double* %1 to i64
  %sunkaddr10 = ptrtoint double* %1 to i64
  %sunkaddr = ptrtoint double* %1 to i64
  br label %4

; <label>:4:                                      ; preds = %._crit_edge._crit_edge, %3
  %indvars.iv315 = phi i64 [ 0, %3 ], [ %indvars.iv.next4, %._crit_edge._crit_edge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv315
  %6 = load double, double* %5, align 8
  %7 = getelementptr inbounds double, double* %1, i64 %indvars.iv315
  store double %6, double* %7, align 8
  %exitcond13 = icmp eq i64 %indvars.iv315, 0
  br i1 %exitcond13, label %.._crit_edge_crit_edge, label %.lr.ph

.._crit_edge_crit_edge:                           ; preds = %4
  br label %._crit_edge

.lr.ph:                                           ; preds = %4
  %xtraiter = and i64 %indvars.iv315, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv315, i64 0
  %9 = load double, double* %8, align 8
  %10 = load double, double* %1, align 8
  %11 = fmul double %9, %10
  %12 = fsub double %6, %11
  %sunkaddr7 = shl i64 %indvars.iv315, 3
  %sunkaddr8 = add i64 %sunkaddr, %sunkaddr7
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to double*
  store double %12, double* %sunkaddr9, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %.prol.preheader
  %.lcssa1.unr.ph = phi double [ %12, %.prol.preheader ], [ undef, %.lr.ph..prol.loopexit_crit_edge ]
  %.unr.ph = phi double [ %12, %.prol.preheader ], [ %6, %.lr.ph..prol.loopexit_crit_edge ]
  %indvars.iv14.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %13 = icmp eq i64 %indvars.iv315, 1
  br i1 %13, label %.prol.loopexit.._crit_edge_crit_edge, label %.prol.loopexit..lr.ph.new_crit_edge

.prol.loopexit..lr.ph.new_crit_edge:              ; preds = %.prol.loopexit
  %sunkaddr11 = shl i64 %indvars.iv315, 3
  %sunkaddr12 = add i64 %sunkaddr10, %sunkaddr11
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to double*
  br label %.lr.ph.new

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.prol.loopexit..lr.ph.new_crit_edge
  %14 = phi double [ %26, %.lr.ph.new..lr.ph.new_crit_edge ], [ %.unr.ph, %.prol.loopexit..lr.ph.new_crit_edge ]
  %indvars.iv14 = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv14.unr.ph, %.prol.loopexit..lr.ph.new_crit_edge ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv315, i64 %indvars.iv14
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv14
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %14, %19
  store double %20, double* %sunkaddr13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv315, i64 %indvars.iv.next
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %sunkaddr13, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv14, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv315
  br i1 %exitcond.1, label %.lr.ph.new.._crit_edge_crit_edge, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.lr.ph.new.._crit_edge_crit_edge:                 ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.new.._crit_edge_crit_edge, %.prol.loopexit.._crit_edge_crit_edge, %.._crit_edge_crit_edge
  %.lcssa = phi double [ %.lcssa1.unr.ph, %.prol.loopexit.._crit_edge_crit_edge ], [ %6, %.._crit_edge_crit_edge ], [ %26, %.lr.ph.new.._crit_edge_crit_edge ]
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv315, i64 %indvars.iv315
  %28 = load double, double* %27, align 8
  %29 = fdiv double %.lcssa, %28
  %sunkaddr15 = shl i64 %indvars.iv315, 3
  %sunkaddr16 = add i64 %sunkaddr14, %sunkaddr15
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to double*
  store double %29, double* %sunkaddr17, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv315, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond5, label %30, label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  br label %4

; <label>:30:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %7

; <label>:7:                                      ; preds = %._crit_edge._crit_edge, %1
  %8 = phi %struct._IO_FILE* [ %6, %1 ], [ %17, %._crit_edge._crit_edge ]
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %9 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %10 = load double, double* %9, align 8
  %11 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %10) #6
  %12 = trunc i64 %indvars.iv1 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %7
  br label %._crit_edge

; <label>:15:                                     ; preds = %7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %15
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %18, label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  br label %7

; <label>:18:                                     ; preds = %._crit_edge
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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

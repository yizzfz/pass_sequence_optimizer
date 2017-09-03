; ModuleID = 'B.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [2100 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2100, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %12, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [2100 x double]* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph9.preheader:
  br label %.lr.ph9

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %4 ]
  %5 = add nuw nsw i64 %indvars.iv, %indvars.iv11
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 2100
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 9.500000e+03
  %10 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  store double %9, double* %10, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = add nuw nsw i64 %indvars.iv.next, %indvars.iv11
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 2100
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 9.500000e+03
  %16 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv.next
  store double %15, double* %16, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 2099
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us, label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next12, 1900
  br i1 %exitcond18, label %._crit_edge6, label %.preheader.us

.lr.ph9:                                          ; preds = %.lr.ph9, %.lr.ph9.preheader
  %indvars.iv14 = phi i64 [ 0, %.lr.ph9.preheader ], [ %indvars.iv.next15.2, %.lr.ph9 ]
  %17 = trunc i64 %indvars.iv14 to i32
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 2.100000e+03
  %20 = fadd double %19, 1.000000e+00
  %21 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  store double %20, double* %21, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %22 = trunc i64 %indvars.iv.next15 to i32
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 2.100000e+03
  %25 = fadd double %24, 1.000000e+00
  %26 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next15
  store double %25, double* %26, align 8
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv14, 2
  %27 = trunc i64 %indvars.iv.next15.1 to i32
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, 2.100000e+03
  %30 = fadd double %29, 1.000000e+00
  %31 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next15.1
  store double %30, double* %31, align 8
  %exitcond17.2 = icmp eq i64 %indvars.iv.next15.1, 2099
  %indvars.iv.next15.2 = add nsw i64 %indvars.iv14, 3
  br i1 %exitcond17.2, label %.preheader.us.preheader, label %.lr.ph9

.preheader.us.preheader:                          ; preds = %.lr.ph9
  br label %.preheader.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax(i32, i32, [2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph8.split.us.preheader:
  %6 = bitcast double* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 16800, i32 8, i1 false)
  %sunkaddr39 = ptrtoint double* %5 to i64
  %scevgep = getelementptr double, double* %4, i64 2100
  %scevgep43 = bitcast double* %scevgep to i8*
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph8.split.us.preheader
  %indvars.iv26 = phi i64 [ 0, %.lr.ph8.split.us.preheader ], [ %7, %._crit_edge.us ]
  %scevgep44 = getelementptr [2100 x double], [2100 x double]* %2, i64 %indvars.iv26, i64 0
  %7 = add nuw nsw i64 %indvars.iv26, 1
  %scevgep46 = getelementptr [2100 x double], [2100 x double]* %2, i64 %7, i64 0
  %8 = getelementptr inbounds double, double* %5, i64 %indvars.iv26
  store double 0.000000e+00, double* %8, align 8
  %sunkaddr40 = shl i64 %indvars.iv26, 3
  %sunkaddr41 = add i64 %sunkaddr39, %sunkaddr40
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to double*
  %.pre = load double, double* %sunkaddr42, align 8
  br label %30

._crit_edge.us.loopexit:                          ; preds = %.lr.ph6.us
  br label %._crit_edge.us

._crit_edge.us.loopexit58:                        ; preds = %vector.body
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit58, %._crit_edge.us.loopexit
  %exitcond56 = icmp eq i64 %7, 1900
  br i1 %exitcond56, label %._crit_edge9, label %.lr.ph8.split.us

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader57, %.lr.ph6.us..lr.ph6.us_crit_edge
  %9 = phi double [ %49, %.lr.ph6.us.preheader57 ], [ %.pre59, %.lr.ph6.us..lr.ph6.us_crit_edge ]
  %indvars.iv22 = phi i64 [ 0, %.lr.ph6.us.preheader57 ], [ %indvars.iv.next23.2, %.lr.ph6.us..lr.ph6.us_crit_edge ]
  %10 = getelementptr inbounds double, double* %4, i64 %indvars.iv22
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv22
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %9
  %15 = fadd double %11, %14
  store double %15, double* %10, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %16 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next23
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv.next23
  %19 = load double, double* %18, align 8
  %20 = load double, double* %sunkaddr42, align 8
  %21 = fmul double %19, %20
  %22 = fadd double %17, %21
  store double %22, double* %16, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %23 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next23.1
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv.next23.1
  %26 = load double, double* %25, align 8
  %27 = load double, double* %sunkaddr42, align 8
  %28 = fmul double %26, %27
  %29 = fadd double %24, %28
  store double %29, double* %23, align 8
  %exitcond25.2 = icmp eq i64 %indvars.iv.next23.1, 2099
  br i1 %exitcond25.2, label %._crit_edge.us.loopexit, label %.lr.ph6.us..lr.ph6.us_crit_edge, !llvm.loop !1

.lr.ph6.us..lr.ph6.us_crit_edge:                  ; preds = %.lr.ph6.us
  %indvars.iv.next23.2 = add nsw i64 %indvars.iv22, 3
  %.pre59 = load double, double* %sunkaddr42, align 8
  br label %.lr.ph6.us

; <label>:30:                                     ; preds = %30, %.lr.ph8.split.us
  %31 = phi double [ %.pre, %.lr.ph8.split.us ], [ %49, %30 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph8.split.us ], [ %indvars.iv.next.2, %30 ]
  %32 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %31, %36
  store double %37, double* %sunkaddr42, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %38 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv.next
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %37, %42
  store double %43, double* %sunkaddr42, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %44 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv.next.1
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.1
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fadd double %43, %48
  store double %49, double* %sunkaddr42, align 8
  %exitcond.2 = icmp eq i64 %indvars.iv.next.1, 2099
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  br i1 %exitcond.2, label %.lr.ph6.us.preheader, label %30

.lr.ph6.us.preheader:                             ; preds = %30
  %bound0 = icmp ugt double* %scevgep46, %4
  %bound1 = icmp ult double* %scevgep44, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  %bc = inttoptr i64 %sunkaddr41 to i8*
  %bound049 = icmp ult i8* %6, %bc
  %bound150 = icmp ult i8* %bc, %scevgep43
  %found.conflict51 = and i1 %bound049, %bound150
  %conflict.rdx = or i1 %found.conflict, %found.conflict51
  br i1 %conflict.rdx, label %.lr.ph6.us.preheader57, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph6.us.preheader
  %50 = insertelement <2 x double> undef, double %49, i32 0
  %51 = shufflevector <2 x double> %50, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

.lr.ph6.us.preheader57:                           ; preds = %.lr.ph6.us.preheader
  br label %.lr.ph6.us

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %52 = getelementptr inbounds double, double* %4, i64 %index
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !4, !noalias !7
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !4, !noalias !7
  %56 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv26, i64 %index
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !10
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !10
  %60 = fmul <2 x double> %wide.load54, %51
  %61 = fmul <2 x double> %wide.load55, %51
  %62 = fadd <2 x double> %wide.load, %60
  %63 = fadd <2 x double> %wide.load53, %61
  store <2 x double> %62, <2 x double>* %53, align 8, !alias.scope !4, !noalias !7
  store <2 x double> %63, <2 x double>* %55, align 8, !alias.scope !4, !noalias !7
  %index.next = add nuw nsw i64 %index, 4
  %64 = icmp eq i64 %index.next, 2100
  br i1 %64, label %._crit_edge.us.loopexit58, label %vector.body, !llvm.loop !11

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %.lr.ph._crit_edge

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %9, %.lr.ph
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8, !9}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = !{!8}
!11 = distinct !{!11, !2, !3}

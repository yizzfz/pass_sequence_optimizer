; ModuleID = 'A.ll'
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
  %3 = call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  call fastcc void @init_array([2100 x double]* %7, double* %8)
  call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_atax([2100 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  call fastcc void @print_array(double* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2100 x double]* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph9:
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.lr.ph9
  %indvars.iv17 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next18.2, %._crit_edge1 ]
  %2 = trunc i64 %indvars.iv17 to i32
  %3 = sitofp i32 %2 to double
  %4 = getelementptr inbounds double, double* %1, i64 %indvars.iv17
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %5 = trunc i64 %indvars.iv.next18 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %3, i32 0
  %8 = insertelement <2 x double> %7, double %6, i32 1
  %9 = fdiv <2 x double> %8, <double 2.100000e+03, double 2.100000e+03>
  %10 = fadd <2 x double> %9, <double 1.000000e+00, double 1.000000e+00>
  %11 = bitcast double* %4 to <2 x double>*
  store <2 x double> %10, <2 x double>* %11, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %12 = trunc i64 %indvars.iv.next18.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.100000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next18.1
  store double %15, double* %16, align 8
  %indvars.iv.next18.2 = add nsw i64 %indvars.iv17, 3
  %exitcond25.2 = icmp eq i64 %indvars.iv.next18.2, 2100
  br i1 %exitcond25.2, label %.lr.ph.us.preheader, label %._crit_edge1

.lr.ph.us.preheader:                              ; preds = %._crit_edge1
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %.loopexit
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %.loopexit ], [ 0, %.lr.ph.us.preheader ]
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new, %.lr.ph.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.1, %.lr.ph.us.new ]
  %17 = add nsw i64 %indvars.iv15, %indvars.iv
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 2100
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %22 = add nsw i64 %indvars.iv15, %indvars.iv.next
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 2100
  %25 = sitofp i32 %24 to double
  %26 = insertelement <2 x double> undef, double %20, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fdiv <2 x double> %27, <double 9.500000e+03, double 9.500000e+03>
  %29 = bitcast double* %21 to <2 x double>*
  store <2 x double> %28, <2 x double>* %29, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %.loopexit, label %.lr.ph.us.new

.loopexit:                                        ; preds = %.lr.ph.us.new
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, 1900
  br i1 %exitcond, label %.loopexit23, label %.lr.ph.us

.loopexit23:                                      ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_atax([2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double*) unnamed_addr #0 {
.lr.ph14:
  %scevgep7475 = bitcast double* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7475, i8 0, i64 16800, i32 8, i1 false)
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.lr.ph14
  %indvars.iv71 = phi i64 [ 0, %.lr.ph14 ], [ %indvars.iv.next72.24, %._crit_edge1 ]
  %indvars.iv.next72.24 = add nsw i64 %indvars.iv71, 25
  %exitcond98.24 = icmp eq i64 %indvars.iv.next72.24, 2100
  br i1 %exitcond98.24, label %.lr.ph.us.preheader, label %._crit_edge1

.lr.ph.us.preheader:                              ; preds = %._crit_edge1
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  %sunkaddr89 = ptrtoint double* %3 to i64
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %.loopexit
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %.loopexit ], [ 0, %.lr.ph.us.preheader ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv65
  store double 0.000000e+00, double* %4, align 8
  %sunkaddr86 = shl nuw nsw i64 %indvars.iv65, 3
  %sunkaddr87 = add i64 %sunkaddr, %sunkaddr86
  %sunkaddr88 = inttoptr i64 %sunkaddr87 to double*
  %sunkaddr86.1 = shl nuw nsw i64 %indvars.iv65, 3
  %sunkaddr87.1 = add i64 %sunkaddr.1, %sunkaddr86.1
  %sunkaddr88.1 = inttoptr i64 %sunkaddr87.1 to double*
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3, %.lr.ph.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.1, %._crit_edge3 ]
  %5 = load double, double* %sunkaddr88, align 8
  %6 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = fmul double %7, %9
  %11 = fadd double %5, %10
  store double %11, double* %sunkaddr88, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = load double, double* %sunkaddr88.1, align 8
  %13 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %12, %17
  store double %18, double* %sunkaddr88.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.14 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.14, label %.lr.ph2.us.new.preheader, label %._crit_edge3

.lr.ph2.us.new.preheader:                         ; preds = %._crit_edge3
  %sunkaddr90 = shl nuw nsw i64 %indvars.iv65, 3
  %sunkaddr91 = add i64 %sunkaddr89, %sunkaddr90
  %sunkaddr92 = inttoptr i64 %sunkaddr91 to double*
  br label %.lr.ph2.us.new

.lr.ph2.us.new:                                   ; preds = %.lr.ph2.us.new.preheader, %.lr.ph2.us.new
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.1, %.lr.ph2.us.new ], [ 0, %.lr.ph2.us.new.preheader ]
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv63
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv63
  %22 = load double, double* %21, align 8
  %23 = load double, double* %sunkaddr92, align 8
  %24 = fmul double %22, %23
  %25 = fadd double %20, %24
  store double %25, double* %19, align 8
  %indvars.iv.next64 = or i64 %indvars.iv63, 1
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next64
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv.next64
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr92, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %27, %31
  store double %32, double* %26, align 8
  %indvars.iv.next64.1 = add nuw nsw i64 %indvars.iv63, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next64.1, 2100
  br i1 %exitcond.1, label %.loopexit, label %.lr.ph2.us.new

.loopexit:                                        ; preds = %.lr.ph2.us.new
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next66, 1900
  br i1 %exitcond96, label %.loopexit93, label %.lr.ph.us

.loopexit93:                                      ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge1, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge1 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %._crit_edge1

; <label>:8:                                      ; preds = %._crit_edge2
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge2, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %.loopexit, label %._crit_edge2

.loopexit:                                        ; preds = %._crit_edge1
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %18

; <label>:18:                                     ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]*) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %22, %4
  %indvars.iv6 = phi i64 [ 0, %4 ], [ %indvars.iv.next7, %22 ]
  %5 = trunc i64 %indvars.iv6 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv6, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv6, %indvars.iv.next
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.200000e+03>
  %20 = fadd <2 x double> %8, %19
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 1400
  br i1 %exitcond, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph81:
  %sunkaddr185 = ptrtoint double* %5 to i64
  br label %.lr.ph81.split.us

.lr.ph81.split.us:                                ; preds = %._crit_edge76.us, %.lr.ph81
  %indvars.iv143 = phi i64 [ 0, %.lr.ph81 ], [ %indvars.iv.next144, %._crit_edge76.us ]
  %sext153 = shl i64 %indvars.iv143, 32
  %7 = ashr exact i64 %sext153, 32
  %8 = getelementptr inbounds double, double* %5, i64 %7
  store double 0.000000e+00, double* %8, align 8
  %sunkaddr186 = shl i64 %indvars.iv143, 3
  %sunkaddr187 = add i64 %sunkaddr185, %sunkaddr186
  %sunkaddr188 = inttoptr i64 %sunkaddr187 to double*
  %.pre160 = load double, double* %sunkaddr188, align 8
  br label %.lr.ph81.split.us.new

.lr.ph81.split.us.new:                            ; preds = %.lr.ph81.split.us, %.lr.ph81.split.us.new
  %9 = phi double [ %21, %.lr.ph81.split.us.new ], [ %.pre160, %.lr.ph81.split.us ]
  %indvars.iv135 = phi i64 [ %indvars.iv.next136.3, %.lr.ph81.split.us.new ], [ 0, %.lr.ph81.split.us ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv135, i64 %indvars.iv143
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %sunkaddr188, align 8
  %indvars.iv.next136 = or i64 %indvars.iv135, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next136, i64 %indvars.iv143
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr188, align 8
  %indvars.iv.next136.1 = or i64 %indvars.iv135, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next136.1, i64 %indvars.iv143
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr188, align 8
  %indvars.iv.next136.2 = or i64 %indvars.iv135, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next136.2, i64 %indvars.iv143
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %sunkaddr188, align 8
  %indvars.iv.next136.3 = add nuw nsw i64 %indvars.iv135, 4
  %exitcond138.3 = icmp eq i64 %indvars.iv.next136.3, 1400
  br i1 %exitcond138.3, label %._crit_edge76.us, label %.lr.ph81.split.us.new

._crit_edge76.us:                                 ; preds = %.lr.ph81.split.us.new
  %22 = fdiv double %21, %2
  store double %22, double* %sunkaddr188, align 8
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %exitcond229 = icmp eq i64 %indvars.iv.next144, 1200
  br i1 %exitcond229, label %.lr.ph68.split.us.preheader, label %.lr.ph81.split.us

.lr.ph68.split.us.preheader:                      ; preds = %._crit_edge76.us
  %sunkaddr205 = ptrtoint double* %6 to i64
  %sunkaddr205.1 = ptrtoint double* %6 to i64
  br label %.lr.ph68.split.us

.lr.ph68.split.us:                                ; preds = %._crit_edge64.us, %.lr.ph68.split.us.preheader
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge64.us ], [ 0, %.lr.ph68.split.us.preheader ]
  %sext151 = shl i64 %indvars.iv129, 32
  %23 = ashr exact i64 %sext151, 32
  %24 = getelementptr inbounds double, double* %6, i64 %23
  store double 0.000000e+00, double* %24, align 8
  %25 = getelementptr inbounds double, double* %6, i64 %indvars.iv129
  %.pre162 = load double, double* %25, align 8
  %sunkaddr202 = shl i64 %indvars.iv129, 3
  %sunkaddr203 = add i64 %sunkaddr185, %sunkaddr202
  %sunkaddr204 = inttoptr i64 %sunkaddr203 to double*
  %sunkaddr207 = add i64 %sunkaddr205, %sunkaddr202
  %sunkaddr208 = inttoptr i64 %sunkaddr207 to double*
  %sunkaddr202.1 = shl i64 %indvars.iv129, 3
  %sunkaddr203.1 = add i64 %sunkaddr185, %sunkaddr202.1
  %sunkaddr204.1 = inttoptr i64 %sunkaddr203.1 to double*
  %sunkaddr207.1 = add i64 %sunkaddr205.1, %sunkaddr202.1
  %sunkaddr208.1 = inttoptr i64 %sunkaddr207.1 to double*
  br label %26

; <label>:26:                                     ; preds = %26, %.lr.ph68.split.us
  %27 = phi double [ %.pre162, %.lr.ph68.split.us ], [ %39, %26 ]
  %indvars.iv126 = phi i64 [ 0, %.lr.ph68.split.us ], [ %indvars.iv.next127.1, %26 ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv126, i64 %indvars.iv129
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr204, align 8
  %31 = fsub double %29, %30
  %32 = fmul double %31, %31
  %33 = fadd double %27, %32
  store double %33, double* %sunkaddr208, align 8
  %indvars.iv.next127 = or i64 %indvars.iv126, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next127, i64 %indvars.iv129
  %35 = load double, double* %34, align 8
  %36 = load double, double* %sunkaddr204.1, align 8
  %37 = fsub double %35, %36
  %38 = fmul double %37, %37
  %39 = fadd double %33, %38
  store double %39, double* %sunkaddr208.1, align 8
  %indvars.iv.next127.1 = add nsw i64 %indvars.iv126, 2
  %40 = icmp slt i64 %indvars.iv.next127.1, 1400
  br i1 %40, label %26, label %._crit_edge64.us

._crit_edge64.us:                                 ; preds = %26
  %41 = fdiv double %39, %2
  store double %41, double* %sunkaddr208.1, align 8
  %42 = tail call double @sqrt(double %41) #4
  %43 = fcmp ugt double %42, 1.000000e-01
  %44 = select i1 %43, double %42, double 1.000000e+00
  store double %44, double* %sunkaddr208.1, align 8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond228 = icmp eq i64 %indvars.iv.next130, 1200
  br i1 %exitcond228, label %._crit_edge11.us.preheader, label %.lr.ph68.split.us

._crit_edge11.us.preheader:                       ; preds = %._crit_edge64.us
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge54.us, %._crit_edge11.us.preheader
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %._crit_edge54.us ], [ 0, %._crit_edge11.us.preheader ]
  br label %45

; <label>:45:                                     ; preds = %45, %._crit_edge11.us
  %indvars.iv122 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next123, %45 ]
  %46 = getelementptr inbounds double, double* %5, i64 %indvars.iv122
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv124, i64 %indvars.iv122
  %49 = load double, double* %48, align 8
  %50 = fsub double %49, %47
  store double %50, double* %48, align 8
  %51 = tail call double @sqrt(double %2) #4
  %52 = getelementptr inbounds double, double* %6, i64 %indvars.iv122
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = load double, double* %48, align 8
  %56 = fdiv double %55, %54
  store double %56, double* %48, align 8
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond226 = icmp eq i64 %indvars.iv.next123, 1200
  br i1 %exitcond226, label %._crit_edge54.us, label %45

._crit_edge54.us:                                 ; preds = %45
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %exitcond227 = icmp eq i64 %indvars.iv.next125, 1400
  br i1 %exitcond227, label %.lr.ph31.split.us.preheader, label %._crit_edge11.us

.lr.ph31.split.us.preheader:                      ; preds = %._crit_edge54.us
  br label %.lr.ph31.split.us

.lr.ph31.split.us:                                ; preds = %._crit_edge24.us-lcssa.us.us, %.lr.ph31.split.us.preheader
  %indvars.iv223 = phi i64 [ 0, %.lr.ph31.split.us.preheader ], [ %indvars.iv.next224, %._crit_edge24.us-lcssa.us.us ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv223, i64 %indvars.iv223
  store double 1.000000e+00, double* %57, align 8
  %indvars.iv.next224 = add nuw nsw i64 %indvars.iv223, 1
  br i1 true, label %.lr.ph23.us, label %._crit_edge24.us-lcssa.us.us

._crit_edge24.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge18.us.us
  br label %._crit_edge24.us-lcssa.us.us

._crit_edge24.us-lcssa.us.us:                     ; preds = %._crit_edge24.us-lcssa.us.us.loopexit, %.lr.ph31.split.us
  %exitcond225 = icmp eq i64 %indvars.iv.next224, 1199
  br i1 %exitcond225, label %73, label %.lr.ph31.split.us

.lr.ph23.us:                                      ; preds = %.lr.ph31.split.us
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge18.us.us, %.lr.ph23.us
  %indvars.iv104 = phi i64 [ %indvars.iv.next224, %.lr.ph23.us ], [ %indvars.iv.next105, %._crit_edge18.us.us ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv223, i64 %indvars.iv104
  store double 0.000000e+00, double* %58, align 8
  br label %.lr.ph.us.us.new

._crit_edge18.us.us:                              ; preds = %.lr.ph.us.us.new
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv104, i64 %indvars.iv223
  store double %72, double* %59, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next105 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 1200
  br i1 %exitcond, label %._crit_edge24.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %60 = phi double [ %72, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv223
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv104
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %65, %60
  store double %66, double* %58, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv223
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv104
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %71, %66
  store double %72, double* %58, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge18.us.us, label %.lr.ph.us.us.new

; <label>:73:                                     ; preds = %._crit_edge24.us-lcssa.us.us
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %74, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
._crit_edge.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge4.us, %._crit_edge.us.preheader
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next14, %._crit_edge4.us ]
  %6 = mul nuw nsw i64 %indvars.iv13, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %6, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge4.us, label %7

._crit_edge4.us:                                  ; preds = %14
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond15, label %19, label %._crit_edge.us

; <label>:19:                                     ; preds = %._crit_edge4.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

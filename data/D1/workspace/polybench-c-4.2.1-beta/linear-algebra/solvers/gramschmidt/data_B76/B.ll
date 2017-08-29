; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #2 {
.preheader23.lr.ph:
  br label %.preheader23.us

.preheader23.us:                                  ; preds = %.preheader23.lr.ph, %._crit_edge29.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge29.us ], [ 0, %.preheader23.lr.ph ]
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader23.us
  %indvars.iv34 = phi i64 [ 0, %.preheader23.us ], [ %indvars.iv.next35, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv34, %indvars.iv39
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = fmul double %10, 1.000000e+02
  %12 = fadd double %11, 1.000000e+01
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv34
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv34
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, 1200
  br i1 %exitcond, label %._crit_edge29.us, label %5

._crit_edge29.us:                                 ; preds = %5
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 1000
  br i1 %exitcond42, label %._crit_edge.us.3.preheader, label %.preheader23.us

._crit_edge.us.3.preheader:                       ; preds = %._crit_edge29.us
  br label %._crit_edge.us.3

._crit_edge26:                                    ; preds = %._crit_edge.us.3
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.us.3.preheader ], [ %indvars.iv.next.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 0
  %scevgep33 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep33, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next = or i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 0
  %scevgep33.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep33.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1, i64 0
  %scevgep33.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep33.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2, i64 0
  %scevgep33.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep33.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %scevgep.144 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.3, i64 0
  %scevgep33.145 = bitcast double* %scevgep.144 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep33.145, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.146 = or i64 %indvars.iv, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.146, i64 0
  %scevgep33.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep33.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.1.1 = or i64 %indvars.iv, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1.1, i64 0
  %scevgep33.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep33.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.2.1 = or i64 %indvars.iv, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2.1, i64 0
  %scevgep33.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep33.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %._crit_edge26, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gramschmidt(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader58.lr.ph:
  br label %.preheader58

.preheader58:                                     ; preds = %._crit_edge72, %.preheader58.lr.ph
  %indvars.iv121 = phi i64 [ 0, %.preheader58.lr.ph ], [ %indvars.iv.next122, %._crit_edge72 ]
  %indvars.iv114 = phi i64 [ 1, %.preheader58.lr.ph ], [ %indvars.iv.next115, %._crit_edge72 ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.preheader58, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %.preheader58 ]
  %.059 = phi double [ %20, %.lr.ph.new ], [ 0.000000e+00, %.preheader58 ]
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv121
  %6 = load double, double* %5, align 8
  %7 = fmul double %6, %6
  %8 = fadd double %.059, %7
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv121
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fadd double %8, %11
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv121
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %14
  %16 = fadd double %12, %15
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv121
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %18
  %20 = fadd double %16, %19
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond.3, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
  %21 = tail call double @sqrt(double %20) #4
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %indvars.iv121
  store double %21, double* %22, align 8
  br label %.lr.ph63

.preheader57:                                     ; preds = %.lr.ph63
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %23 = icmp slt i64 %indvars.iv.next122, 1200
  br i1 %23, label %.lr.ph71.split.us.preheader, label %._crit_edge72

.lr.ph71.split.us.preheader:                      ; preds = %.preheader57
  br label %.lr.ph71.split.us

.lr.ph71.split.us:                                ; preds = %.lr.ph71.split.us.preheader, %.loopexit.us
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %.loopexit.us ], [ %indvars.iv114, %.lr.ph71.split.us.preheader ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %indvars.iv116
  store double 0.000000e+00, double* %24, align 8
  br label %.lr.ph71.split.us.new

.lr.ph68.us:                                      ; preds = %.lr.ph68.us.preheader, %.lr.ph68.us
  %indvars.iv107 = phi i64 [ %indvars.iv.next108.1, %.lr.ph68.us ], [ 0, %.lr.ph68.us.preheader ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv107, i64 %indvars.iv116
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv107, i64 %indvars.iv121
  %28 = load double, double* %27, align 8
  %29 = load double, double* %24, align 8
  %30 = fmul double %28, %29
  %31 = fsub double %26, %30
  store double %31, double* %25, align 8
  %indvars.iv.next108 = or i64 %indvars.iv107, 1
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next108, i64 %indvars.iv116
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next108, i64 %indvars.iv121
  %35 = load double, double* %34, align 8
  %36 = load double, double* %24, align 8
  %37 = fmul double %35, %36
  %38 = fsub double %33, %37
  store double %38, double* %32, align 8
  %indvars.iv.next108.1 = add nsw i64 %indvars.iv107, 2
  %exitcond.1113 = icmp eq i64 %indvars.iv.next108.1, 1000
  br i1 %exitcond.1113, label %.loopexit.us, label %.lr.ph68.us

.lr.ph71.split.us.new:                            ; preds = %.lr.ph71.split.us, %.lr.ph71.split.us.new
  %indvars.iv98 = phi i64 [ %indvars.iv.next99.1, %.lr.ph71.split.us.new ], [ 0, %.lr.ph71.split.us ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv98, i64 %indvars.iv121
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv98, i64 %indvars.iv116
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = load double, double* %24, align 8
  %45 = fadd double %44, %43
  store double %45, double* %24, align 8
  %indvars.iv.next99 = or i64 %indvars.iv98, 1
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next99, i64 %indvars.iv121
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next99, i64 %indvars.iv116
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = load double, double* %24, align 8
  %52 = fadd double %51, %50
  store double %52, double* %24, align 8
  %indvars.iv.next99.1 = add nsw i64 %indvars.iv98, 2
  %exitcond.1106 = icmp eq i64 %indvars.iv.next99.1, 1000
  br i1 %exitcond.1106, label %.lr.ph68.us.preheader, label %.lr.ph71.split.us.new

.lr.ph68.us.preheader:                            ; preds = %.lr.ph71.split.us.new
  br label %.lr.ph68.us

.loopexit.us:                                     ; preds = %.lr.ph68.us
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond = icmp eq i64 %indvars.iv.next117, 1200
  br i1 %exitcond, label %._crit_edge72.loopexit, label %.lr.ph71.split.us

.lr.ph63:                                         ; preds = %._crit_edge, %.lr.ph63
  %indvars.iv86 = phi i64 [ %indvars.iv.next87.1, %.lr.ph63 ], [ 0, %._crit_edge ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv86, i64 %indvars.iv121
  %54 = load double, double* %53, align 8
  %55 = load double, double* %22, align 8
  %56 = fdiv double %54, %55
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv86, i64 %indvars.iv121
  store double %56, double* %57, align 8
  %indvars.iv.next87 = or i64 %indvars.iv86, 1
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next87, i64 %indvars.iv121
  %59 = load double, double* %58, align 8
  %60 = load double, double* %22, align 8
  %61 = fdiv double %59, %60
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next87, i64 %indvars.iv121
  store double %61, double* %62, align 8
  %indvars.iv.next87.1 = add nsw i64 %indvars.iv86, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next87.1, 1000
  br i1 %exitcond.1, label %.preheader57, label %.lr.ph63

._crit_edge72.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge72

._crit_edge72:                                    ; preds = %._crit_edge72.loopexit, %.preheader57
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond124 = icmp eq i64 %indvars.iv.next122, 1200
  br i1 %exitcond124, label %._crit_edge84, label %.preheader58

._crit_edge84:                                    ; preds = %._crit_edge72
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]* nocapture readnone, [1200 x double]*, [1200 x double]*) #0 {
.preheader25.us.preheader:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader25.us

.preheader25.us:                                  ; preds = %._crit_edge31.us, %.preheader25.us.preheader
  %indvars.iv44 = phi i64 [ 0, %.preheader25.us.preheader ], [ %indvars.iv.next45, %._crit_edge31.us ]
  %9 = mul nsw i64 %indvars.iv44, 1200
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader25.us
  %indvars.iv40 = phi i64 [ 0, %.preheader25.us ], [ %indvars.iv.next41, %17 ]
  %11 = add nsw i64 %indvars.iv40, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv40
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 1200
  br i1 %exitcond43, label %._crit_edge31.us, label %10

._crit_edge31.us:                                 ; preds = %17
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, 1200
  br i1 %exitcond47, label %._crit_edge33, label %.preheader25.us

._crit_edge33:                                    ; preds = %._crit_edge31.us
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge33
  %indvars.iv35 = phi i64 [ 0, %._crit_edge33 ], [ %indvars.iv.next36, %._crit_edge.us ]
  %26 = mul nsw i64 %indvars.iv35, 1200
  br label %27

; <label>:27:                                     ; preds = %34, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %34 ]
  %28 = add nsw i64 %indvars.iv, %26
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #6
  br label %34

; <label>:34:                                     ; preds = %32, %27
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %27

._crit_edge.us:                                   ; preds = %34
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 1000
  br i1 %exitcond38, label %._crit_edge28, label %.preheader.us

._crit_edge28:                                    ; preds = %._crit_edge.us
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %41) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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

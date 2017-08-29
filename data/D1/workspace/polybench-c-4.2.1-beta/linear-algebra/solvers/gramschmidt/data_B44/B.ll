; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %9)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %11
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %2, %14
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
.preheader5.lr.ph:
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge14.us, %.preheader5.lr.ph
  %indvars.iv31 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next32, %._crit_edge14.us ]
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader5.us
  %indvars.iv27 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next28, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv31, %indvars.iv27
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = fmul double %10, 1.000000e+02
  %12 = fadd double %11, 1.000000e+01
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv27
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv27
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 1200
  br i1 %exitcond30, label %._crit_edge14.us, label %5

._crit_edge14.us:                                 ; preds = %5
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond40, label %._crit_edge.us.preheader, label %.preheader5.us

._crit_edge.us.preheader:                         ; preds = %._crit_edge14.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.us.preheader
  %indvar = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvar.next.7, %._crit_edge.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar, i64 0
  %scevgep35 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep35, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next = or i64 %indvar, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next, i64 0
  %scevgep35.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep35.1, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.1 = or i64 %indvar, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next.1, i64 0
  %scevgep35.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep35.2, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.2 = or i64 %indvar, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next.2, i64 0
  %scevgep35.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep35.3, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.3 = or i64 %indvar, 4
  %scevgep.4 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next.3, i64 0
  %scevgep35.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep35.4, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.4 = or i64 %indvar, 5
  %scevgep.5 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next.4, i64 0
  %scevgep35.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep35.5, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.5 = or i64 %indvar, 6
  %scevgep.6 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next.5, i64 0
  %scevgep35.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep35.6, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.6 = or i64 %indvar, 7
  %scevgep.7 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next.6, i64 0
  %scevgep35.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep35.7, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.7 = add nsw i64 %indvar, 8
  %exitcond.7 = icmp eq i64 %indvar.next.7, 1200
  br i1 %exitcond.7, label %._crit_edge7, label %._crit_edge.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
.lr.ph43:
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge26, %.lr.ph43
  %indvars.iv88 = phi i64 [ 0, %.lr.ph43 ], [ %indvars.iv.next89, %._crit_edge26 ]
  %indvars.iv82 = phi i64 [ 1, %.lr.ph43 ], [ %indvars.iv.next83, %._crit_edge26 ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %.lr.ph ]
  %5 = phi double [ %21, %.lr.ph.new ], [ 0.000000e+00, %.lr.ph ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv88
  %7 = load double, double* %6, align 8
  %8 = fmul double %7, %7
  %9 = fadd double %5, %8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv88
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %11
  %13 = fadd double %9, %12
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv88
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %15
  %17 = fadd double %13, %16
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv88
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = fadd double %17, %20
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond.3, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
  %22 = call double @sqrt(double %21) #4
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv88, i64 %indvars.iv88
  store double %22, double* %23, align 8
  br label %.lr.ph10.new

.lr.ph10.new:                                     ; preds = %._crit_edge, %.lr.ph10.new
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.lr.ph10.new ], [ 0, %._crit_edge ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv55, i64 %indvars.iv88
  %25 = load double, double* %24, align 8
  %26 = load double, double* %23, align 8
  %27 = fdiv double %25, %26
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv88
  store double %27, double* %28, align 8
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next56, i64 %indvars.iv88
  %30 = load double, double* %29, align 8
  %31 = load double, double* %23, align 8
  %32 = fdiv double %30, %31
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next56, i64 %indvars.iv88
  store double %32, double* %33, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, 1000
  br i1 %exitcond58.1, label %._crit_edge11, label %.lr.ph10.new

._crit_edge11:                                    ; preds = %.lr.ph10.new
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %34 = icmp slt i64 %indvars.iv.next89, 1200
  br i1 %34, label %.lr.ph25.split.us.preheader, label %._crit_edge26

.lr.ph25.split.us.preheader:                      ; preds = %._crit_edge11
  br label %.lr.ph25.split.us

.lr.ph25.split.us:                                ; preds = %.lr.ph25.split.us.preheader, %._crit_edge19.us
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge19.us ], [ %indvars.iv82, %.lr.ph25.split.us.preheader ]
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv88, i64 %indvars.iv84
  store double 0.000000e+00, double* %35, align 8
  br label %.lr.ph25.split.us.new

._crit_edge19.us:                                 ; preds = %.lr.ph18.us.new
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next85 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 1200
  br i1 %exitcond, label %._crit_edge26.loopexit, label %.lr.ph25.split.us

.lr.ph18.us.new:                                  ; preds = %.lr.ph18.us.new.preheader, %.lr.ph18.us.new
  %indvars.iv78 = phi i64 [ %indvars.iv.next79.1, %.lr.ph18.us.new ], [ 0, %.lr.ph18.us.new.preheader ]
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv78, i64 %indvars.iv84
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv78, i64 %indvars.iv88
  %39 = load double, double* %38, align 8
  %40 = load double, double* %35, align 8
  %41 = fmul double %39, %40
  %42 = fsub double %37, %41
  store double %42, double* %36, align 8
  %indvars.iv.next79 = or i64 %indvars.iv78, 1
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next79, i64 %indvars.iv84
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next79, i64 %indvars.iv88
  %46 = load double, double* %45, align 8
  %47 = load double, double* %35, align 8
  %48 = fmul double %46, %47
  %49 = fsub double %44, %48
  store double %49, double* %43, align 8
  %indvars.iv.next79.1 = add nuw nsw i64 %indvars.iv78, 2
  %exitcond81.1 = icmp eq i64 %indvars.iv.next79.1, 1000
  br i1 %exitcond81.1, label %._crit_edge19.us, label %.lr.ph18.us.new

.lr.ph25.split.us.new:                            ; preds = %.lr.ph25.split.us, %.lr.ph25.split.us.new
  %50 = phi double [ %62, %.lr.ph25.split.us.new ], [ 0.000000e+00, %.lr.ph25.split.us ]
  %indvars.iv74 = phi i64 [ %indvars.iv.next75.1, %.lr.ph25.split.us.new ], [ 0, %.lr.ph25.split.us ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv74, i64 %indvars.iv88
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv74, i64 %indvars.iv84
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %55, %50
  store double %56, double* %35, align 8
  %indvars.iv.next75 = or i64 %indvars.iv74, 1
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next75, i64 %indvars.iv88
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next75, i64 %indvars.iv84
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %61, %56
  store double %62, double* %35, align 8
  %indvars.iv.next75.1 = add nuw nsw i64 %indvars.iv74, 2
  %exitcond77.1 = icmp eq i64 %indvars.iv.next75.1, 1000
  br i1 %exitcond77.1, label %.lr.ph18.us.new.preheader, label %.lr.ph25.split.us.new

.lr.ph18.us.new.preheader:                        ; preds = %.lr.ph25.split.us.new
  br label %.lr.ph18.us.new

._crit_edge26.loopexit:                           ; preds = %._crit_edge19.us
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %._crit_edge11
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next89, 1200
  br i1 %exitcond117, label %._crit_edge44, label %.lr.ph

._crit_edge44:                                    ; preds = %._crit_edge26
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
.preheader8.lr.ph:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge20.us, %.preheader8.lr.ph
  %indvars.iv39 = phi i64 [ 0, %.preheader8.lr.ph ], [ %indvars.iv.next40, %._crit_edge20.us ]
  %8 = mul nuw nsw i64 %indvars.iv39, 1200
  br label %9

; <label>:9:                                      ; preds = %._crit_edge.us, %.preheader8.us
  %indvars.iv35 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next36, %._crit_edge.us ]
  %10 = add nuw nsw i64 %8, %indvars.iv35
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge.us

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc7.us = call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %14, %9
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv35
  %18 = load double, double* %17, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 1200
  br i1 %exitcond38, label %._crit_edge20.us, label %9

._crit_edge20.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond2, label %._crit_edge23, label %.preheader8.us

._crit_edge23:                                    ; preds = %._crit_edge20.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %._crit_edge23
  %indvars.iv33 = phi i64 [ 0, %._crit_edge23 ], [ %indvars.iv.next34, %._crit_edge11.us ]
  %24 = mul nuw nsw i64 %indvars.iv33, 1200
  br label %25

; <label>:25:                                     ; preds = %._crit_edge1.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge1.us ]
  %26 = add nuw nsw i64 %24, %indvars.iv
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 20
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %._crit_edge1.us

; <label>:30:                                     ; preds = %25
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %31) #6
  br label %._crit_edge1.us

._crit_edge1.us:                                  ; preds = %30, %25
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv33, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %34) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge11.us, label %25

._crit_edge11.us:                                 ; preds = %._crit_edge1.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next34, 1000
  br i1 %exitcond1, label %._crit_edge13, label %.preheader.us

._crit_edge13:                                    ; preds = %._crit_edge11.us
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %38) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array([1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %20, %2
  %indvars.iv2 = phi i64 [ 0, %2 ], [ %indvars.iv.next3, %20 ]
  %3 = trunc i64 %indvars.iv2 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv2
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv2, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv2
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %6, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 1400
  br i1 %exitcond, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph55.split.us.preheader:
  %5 = alloca double, align 8
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca double*, align 8
  %9 = alloca double, align 8
  store double %0, double* %5, align 8
  store [1200 x double]* %1, [1200 x double]** %6, align 8
  store [1200 x double]* %2, [1200 x double]** %7, align 8
  store double* %4, double** %8, align 8
  store double 1.000000e-01, double* %9, align 8
  %sunkaddr189 = ptrtoint double* %3 to i64
  %sunkaddr189.1 = ptrtoint double* %3 to i64
  br label %.lr.ph55.split.us.new.preheader

.lr.ph55.split.us.new.preheader:                  ; preds = %._crit_edge52.us, %.lr.ph55.split.us.preheader
  %indvars.iv22 = phi i64 [ 0, %.lr.ph55.split.us.preheader ], [ %indvars.iv.next23, %._crit_edge52.us ]
  %10 = getelementptr inbounds double, double* %3, i64 %indvars.iv22
  store double 0.000000e+00, double* %10, align 8
  %sunkaddr190 = shl nsw i64 %indvars.iv22, 3
  %sunkaddr191 = add i64 %sunkaddr189, %sunkaddr190
  %sunkaddr192 = inttoptr i64 %sunkaddr191 to double*
  %sunkaddr190.1 = shl nsw i64 %indvars.iv22, 3
  %sunkaddr191.1 = add i64 %sunkaddr189.1, %sunkaddr190.1
  %sunkaddr192.1 = inttoptr i64 %sunkaddr191.1 to double*
  br label %.lr.ph55.split.us.new

.lr.ph55.split.us.new:                            ; preds = %.lr.ph55.split.us.new, %.lr.ph55.split.us.new.preheader
  %indvars.iv123 = phi i64 [ 0, %.lr.ph55.split.us.new.preheader ], [ %indvars.iv.next124.1.1, %.lr.ph55.split.us.new ]
  %11 = phi double [ 0.000000e+00, %.lr.ph55.split.us.new.preheader ], [ %23, %.lr.ph55.split.us.new ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv22
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %sunkaddr192, align 8
  %indvars.iv.next124 = or i64 %indvars.iv123, 1
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next124, i64 %indvars.iv22
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr192, align 8
  %indvars.iv.next124.1 = or i64 %indvars.iv123, 2
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next124.1, i64 %indvars.iv22
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %sunkaddr192.1, align 8
  %indvars.iv.next124.129 = or i64 %indvars.iv123, 3
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next124.129, i64 %indvars.iv22
  %22 = load double, double* %21, align 8
  %23 = fadd double %22, %20
  store double %23, double* %sunkaddr192.1, align 8
  %indvars.iv.next124.1.1 = add nsw i64 %indvars.iv123, 4
  %exitcond126.1.1 = icmp eq i64 %indvars.iv.next124.1.1, 1400
  br i1 %exitcond126.1.1, label %._crit_edge52.us, label %.lr.ph55.split.us.new

._crit_edge52.us:                                 ; preds = %.lr.ph55.split.us.new
  %24 = fdiv double %23, %0
  store double %24, double* %sunkaddr192.1, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond24, label %.lr.ph49.split.us.preheader, label %.lr.ph55.split.us.new.preheader

.lr.ph49.split.us.preheader:                      ; preds = %._crit_edge52.us
  %.pre = load double*, double** %8, align 8
  %.pre139 = load double, double* %9, align 8
  br label %.lr.ph49.split.us.new.preheader

.lr.ph49.split.us.new.preheader:                  ; preds = %._crit_edge47.us, %.lr.ph49.split.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.lr.ph49.split.us.preheader ], [ %indvars.iv.next20, %._crit_edge47.us ]
  %25 = phi double* [ %4, %.lr.ph49.split.us.preheader ], [ %.pre, %._crit_edge47.us ]
  %26 = getelementptr inbounds double, double* %25, i64 %indvars.iv19
  store double 0.000000e+00, double* %26, align 8
  %sunkaddr172 = shl nsw i64 %indvars.iv19, 3
  %sunkaddr173 = add i64 %sunkaddr189.1, %sunkaddr172
  %sunkaddr174 = inttoptr i64 %sunkaddr173 to double*
  %sunkaddr193 = ptrtoint double* %25 to i64
  %sunkaddr195 = add i64 %sunkaddr193, %sunkaddr172
  %sunkaddr196 = inttoptr i64 %sunkaddr195 to double*
  br label %.lr.ph49.split.us.new

.lr.ph49.split.us.new:                            ; preds = %.lr.ph49.split.us.new.preheader, %.lr.ph49.split.us.new
  %indvars.iv107 = phi i64 [ %indvars.iv.next108.1, %.lr.ph49.split.us.new ], [ 0, %.lr.ph49.split.us.new.preheader ]
  %27 = phi double [ %39, %.lr.ph49.split.us.new ], [ 0.000000e+00, %.lr.ph49.split.us.new.preheader ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv19
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr174, align 8
  %31 = fsub double %29, %30
  %32 = fmul double %31, %31
  %33 = fadd double %32, %27
  store double %33, double* %sunkaddr196, align 8
  %indvars.iv.next108 = or i64 %indvars.iv107, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next108, i64 %indvars.iv19
  %35 = load double, double* %34, align 8
  %36 = load double, double* %sunkaddr174, align 8
  %37 = fsub double %35, %36
  %38 = fmul double %37, %37
  %39 = fadd double %38, %33
  store double %39, double* %sunkaddr196, align 8
  %indvars.iv.next108.1 = add nuw nsw i64 %indvars.iv107, 2
  %exitcond110.1 = icmp eq i64 %indvars.iv.next108.1, 1400
  br i1 %exitcond110.1, label %._crit_edge47.us, label %.lr.ph49.split.us.new

._crit_edge47.us:                                 ; preds = %.lr.ph49.split.us.new
  %40 = fdiv double %39, %0
  store double %40, double* %sunkaddr196, align 8
  %41 = getelementptr inbounds double, double* %.pre, i64 %indvars.iv19
  %42 = load double, double* %41, align 8
  %43 = tail call double @sqrt(double %42) #4
  %44 = fcmp ugt double %43, %.pre139
  %45 = select i1 %44, double %43, double 1.000000e+00
  store double %45, double* %41, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 1200
  br i1 %exitcond21, label %._crit_edge11.us.preheader, label %.lr.ph49.split.us.new.preheader

._crit_edge11.us.preheader:                       ; preds = %._crit_edge47.us
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge42.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge42.us ], [ 0, %._crit_edge11.us.preheader ]
  %46 = phi [1200 x double]* [ %60, %._crit_edge42.us ], [ %1, %._crit_edge11.us.preheader ]
  br label %47

; <label>:47:                                     ; preds = %47, %._crit_edge11.us
  %indvars.iv102 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next103, %47 ]
  %48 = phi [1200 x double]* [ %46, %._crit_edge11.us ], [ %60, %47 ]
  %49 = getelementptr inbounds double, double* %3, i64 %indvars.iv102
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %48, i64 %indvars.iv16, i64 %indvars.iv102
  %52 = load double, double* %51, align 8
  %53 = fsub double %52, %50
  store double %53, double* %51, align 8
  %54 = load double, double* %5, align 8
  %55 = tail call double @sqrt(double %54) #4
  %56 = load double*, double** %8, align 8
  %57 = getelementptr inbounds double, double* %56, i64 %indvars.iv102
  %58 = load double, double* %57, align 8
  %59 = fmul double %55, %58
  %60 = load [1200 x double]*, [1200 x double]** %6, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %60, i64 %indvars.iv16, i64 %indvars.iv102
  %62 = load double, double* %61, align 8
  %63 = fdiv double %62, %59
  store double %63, double* %61, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next103, 1200
  br i1 %exitcond105, label %._crit_edge42.us, label %47

._crit_edge42.us:                                 ; preds = %47
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1400
  br i1 %exitcond18, label %.lr.ph30.split.us.preheader, label %._crit_edge11.us

.lr.ph30.split.us.preheader:                      ; preds = %._crit_edge42.us
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %.lr.ph30.split.us.preheader, %._crit_edge29.us-lcssa.us.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge29.us-lcssa.us.us ], [ 0, %.lr.ph30.split.us.preheader ]
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge29.us-lcssa.us.us ], [ 1, %.lr.ph30.split.us.preheader ]
  %64 = phi [1200 x double]* [ %69, %._crit_edge29.us-lcssa.us.us ], [ %2, %.lr.ph30.split.us.preheader ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %64, i64 %indvars.iv13, i64 %indvars.iv13
  store double 1.000000e+00, double* %65, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  br label %.prol.loopexit..lr.ph.us.us.new_crit_edge

._crit_edge29.us-lcssa.us.us:                     ; preds = %._crit_edge24.us.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1199
  br i1 %exitcond15, label %._crit_edge31, label %.lr.ph30.split.us

.prol.loopexit..lr.ph.us.us.new_crit_edge:        ; preds = %._crit_edge24.us.us, %.lr.ph30.split.us
  %indvars.iv11 = phi i64 [ %indvars.iv9, %.lr.ph30.split.us ], [ %indvars.iv.next12, %._crit_edge24.us.us ]
  %66 = phi [1200 x double]* [ %64, %.lr.ph30.split.us ], [ %69, %._crit_edge24.us.us ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv13, i64 %indvars.iv11
  store double 0.000000e+00, double* %67, align 8
  %68 = load [1200 x double]*, [1200 x double]** %6, align 8
  %69 = load [1200 x double]*, [1200 x double]** %7, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 %indvars.iv13, i64 %indvars.iv11
  %.pre140 = load double, double* %70, align 8
  br label %.lr.ph.us.us.new

._crit_edge24.us.us:                              ; preds = %.lr.ph.us.us.new
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 %indvars.iv11, i64 %indvars.iv13
  store double %84, double* %71, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond, label %._crit_edge29.us-lcssa.us.us, label %.prol.loopexit..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new:                                 ; preds = %.prol.loopexit..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new
  %72 = phi double [ %84, %.lr.ph.us.us.new ], [ %.pre140, %.prol.loopexit..lr.ph.us.us.new_crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.prol.loopexit..lr.ph.us.us.new_crit_edge ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv, i64 %indvars.iv13
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv, i64 %indvars.iv11
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fadd double %77, %72
  store double %78, double* %70, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv.next, i64 %indvars.iv13
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv.next, i64 %indvars.iv11
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = fadd double %83, %78
  store double %84, double* %70, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge24.us.us, label %.lr.ph.us.us.new

._crit_edge31:                                    ; preds = %._crit_edge29.us-lcssa.us.us
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 1199, i64 1199
  store double 1.000000e+00, double* %85, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge2.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge3.us, %._crit_edge2.us.preheader
  %indvars.iv1 = phi i64 [ 0, %._crit_edge2.us.preheader ], [ %indvars.iv.next2, %._crit_edge3.us ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %._crit_edge2.us
  %indvars.iv = phi i64 [ 0, %._crit_edge2.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge3.us, label %6

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge5, label %._crit_edge2.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

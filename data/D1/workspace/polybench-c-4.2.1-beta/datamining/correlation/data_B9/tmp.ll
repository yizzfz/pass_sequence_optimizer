; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca i8*, align 8
  %8 = alloca [1200 x [1200 x double]]*, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1200, i32* %5, align 4
  %11 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  store i8* %11, i8** %7, align 8
  %12 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %13 = bitcast [1200 x [1200 x double]]** %8 to i8**
  store i8* %12, i8** %13, align 8
  %14 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %15 = bitcast [1200 x double]** %9 to i8**
  store i8* %14, i8** %15, align 8
  %16 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %17 = bitcast [1200 x double]** %10 to i8**
  store i8* %16, i8** %17, align 8
  %18 = bitcast i8* %11 to [1200 x double]*
  call void @init_array(double* nonnull %6, [1200 x double]* %18)
  tail call void (...) @polybench_timer_start() #4
  %19 = load double, double* %6, align 8
  %20 = bitcast [1200 x [1200 x double]]** %8 to [1200 x double]**
  %21 = load [1200 x double]*, [1200 x double]** %20, align 8
  %22 = bitcast [1200 x double]** %9 to double**
  %23 = load double*, double** %22, align 8
  %24 = bitcast [1200 x double]** %10 to double**
  %25 = load double*, double** %24, align 8
  tail call void @kernel_correlation(i32 1200, i32 1400, double %19, [1200 x double]* %18, [1200 x double]* %21, double* %23, double* %25)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %26 = load i32, i32* %3, align 4
  %27 = icmp sgt i32 %26, 42
  %28 = bitcast [1200 x double]* %21 to i8*
  %29 = bitcast double* %23 to i8*
  %30 = bitcast double* %25 to i8*
  br i1 %27, label %31, label %._crit_edge

; <label>:31:                                     ; preds = %2
  %32 = load i8**, i8*** %4, align 8
  %33 = load i8*, i8** %32, align 8
  %strcmpload = load i8, i8* %33, align 1
  %34 = icmp eq i8 %strcmpload, 0
  br i1 %34, label %35, label %._crit_edge

; <label>:35:                                     ; preds = %31
  %36 = load i32, i32* %5, align 4
  tail call void @print_array(i32 %36, [1200 x double]* %21)
  br label %._crit_edge

._crit_edge:                                      ; preds = %31, %2, %35
  %37 = load i8*, i8** %7, align 8
  tail call void @free(i8* %37) #4
  tail call void @free(i8* %28) #4
  tail call void @free(i8* %29) #4
  tail call void @free(i8* %30) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture, [1200 x double]* nocapture) #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %17, %2
  %indvars.iv5 = phi i64 [ 0, %2 ], [ %indvars.iv.next6, %17 ]
  %3 = trunc i64 %indvars.iv5 to i32
  %4 = sitofp i32 %3 to double
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %..preheader_crit_edge
  %indvars.iv = phi i64 [ 0, %..preheader_crit_edge ], [ %indvars.iv.next.1, %.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv5, %indvars.iv
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.200000e+03
  %9 = fadd double %4, %8
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %9, double* %10, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv5, %indvars.iv.next
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.200000e+03
  %15 = fadd double %4, %14
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %15, double* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %17, label %.preheader

; <label>:17:                                     ; preds = %.preheader
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1400
  br i1 %exitcond, label %18, label %..preheader_crit_edge

; <label>:18:                                     ; preds = %17
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) #0 {
  %8 = alloca double, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca double*, align 8
  %12 = alloca double*, align 8
  %13 = alloca double, align 8
  store double %2, double* %8, align 8
  store [1200 x double]* %3, [1200 x double]** %9, align 8
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  store double* %5, double** %11, align 8
  store double* %6, double** %12, align 8
  store double 1.000000e-01, double* %13, align 8
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.lr.ph75, label %..preheader11_crit_edge.thread

..preheader11_crit_edge.thread:                   ; preds = %7
  br label %.preheader11..preheader10_crit_edge

.lr.ph75:                                         ; preds = %7
  %15 = icmp sgt i32 %1, 0
  br i1 %15, label %.lr.ph75.split.us.preheader, label %.lr.ph75.split.preheader

.lr.ph75.split.us.preheader:                      ; preds = %.lr.ph75
  %xtraiter155 = and i32 %1, 1
  %lcmp.mod156 = icmp eq i32 %xtraiter155, 0
  %16 = icmp eq i32 %1, 1
  %sunkaddr = ptrtoint double* %5 to i64
  %wide.trip.count152.1 = zext i32 %1 to i64
  %17 = add nsw i64 %wide.trip.count152.1, -2
  br label %.lr.ph75.split.us

.lr.ph75.split.preheader:                         ; preds = %.lr.ph75
  %18 = sext i32 %0 to i64
  %xtraiter192 = and i64 %18, 1
  %lcmp.mod193 = icmp eq i64 %xtraiter192, 0
  br i1 %lcmp.mod193, label %.lr.ph75.split.prol.loopexit, label %.lr.ph75.split.prol.preheader

.lr.ph75.split.prol.preheader:                    ; preds = %.lr.ph75.split.preheader
  br label %.lr.ph75.split.prol

.lr.ph75.split.prol:                              ; preds = %.lr.ph75.split.prol.preheader
  %19 = fdiv double 0.000000e+00, %2
  store double %19, double* %5, align 8
  br label %.lr.ph75.split.prol.loopexit

.lr.ph75.split.prol.loopexit:                     ; preds = %.lr.ph75.split.preheader, %.lr.ph75.split.prol
  %indvars.iv160.unr = phi i64 [ 0, %.lr.ph75.split.preheader ], [ 1, %.lr.ph75.split.prol ]
  %storemerge73.unr = phi i64 [ 0, %.lr.ph75.split.preheader ], [ 1, %.lr.ph75.split.prol ]
  %20 = icmp eq i32 %0, 1
  br i1 %20, label %..preheader11_crit_edge.loopexit178, label %.lr.ph75.split.preheader.new

.lr.ph75.split.preheader.new:                     ; preds = %.lr.ph75.split.prol.loopexit
  br label %.lr.ph75.split

.lr.ph75.split.us:                                ; preds = %.lr.ph75.split.us.preheader, %._crit_edge70.us
  %21 = phi i32 [ %55, %._crit_edge70.us ], [ 0, %.lr.ph75.split.us.preheader ]
  %storemerge73.us = phi i32 [ %55, %._crit_edge70.us ], [ 0, %.lr.ph75.split.us.preheader ]
  %22 = sext i32 %storemerge73.us to i64
  %23 = getelementptr inbounds double, double* %5, i64 %22
  store double 0.000000e+00, double* %23, align 8
  %24 = sext i32 %21 to i64
  br i1 %lcmp.mod156, label %.prol.loopexit154, label %.prol.preheader153

.prol.preheader153:                               ; preds = %.lr.ph75.split.us
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %24
  %26 = load double, double* %25, align 8
  %sunkaddr98.prol = shl nsw i64 %24, 3
  %sunkaddr99.prol = add i64 %sunkaddr, %sunkaddr98.prol
  %sunkaddr100.prol = inttoptr i64 %sunkaddr99.prol to double*
  %27 = load double, double* %sunkaddr100.prol, align 8
  %28 = fadd double %26, %27
  store double %28, double* %sunkaddr100.prol, align 8
  br label %.prol.loopexit154

.prol.loopexit154:                                ; preds = %.prol.preheader153, %.lr.ph75.split.us
  %indvars.iv150.unr.ph = phi i64 [ 1, %.prol.preheader153 ], [ 0, %.lr.ph75.split.us ]
  br i1 %16, label %._crit_edge70.us, label %.lr.ph75.split.us.new.preheader

.lr.ph75.split.us.new.preheader:                  ; preds = %.prol.loopexit154
  %sunkaddr98 = shl nsw i64 %24, 3
  %sunkaddr99 = add i64 %sunkaddr, %sunkaddr98
  %sunkaddr100 = inttoptr i64 %sunkaddr99 to double*
  %.pre = load double, double* %sunkaddr100, align 8
  %29 = sub nsw i64 %17, %indvars.iv150.unr.ph
  %30 = lshr i64 %29, 1
  %31 = and i64 %30, 1
  %lcmp.mod188 = icmp eq i64 %31, 0
  br i1 %lcmp.mod188, label %.lr.ph75.split.us.new.prol.preheader, label %.lr.ph75.split.us.new.prol.loopexit.unr-lcssa

.lr.ph75.split.us.new.prol.preheader:             ; preds = %.lr.ph75.split.us.new.preheader
  br label %.lr.ph75.split.us.new.prol

.lr.ph75.split.us.new.prol:                       ; preds = %.lr.ph75.split.us.new.prol.preheader
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv150.unr.ph, i64 %24
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %.pre
  store double %34, double* %sunkaddr100, align 8
  %indvars.iv.next151.prol = add nuw nsw i64 %indvars.iv150.unr.ph, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next151.prol, i64 %24
  %36 = load double, double* %35, align 8
  %37 = fadd double %36, %34
  store double %37, double* %sunkaddr100, align 8
  %indvars.iv.next151.1.prol = or i64 %indvars.iv150.unr.ph, 2
  br label %.lr.ph75.split.us.new.prol.loopexit.unr-lcssa

.lr.ph75.split.us.new.prol.loopexit.unr-lcssa:    ; preds = %.lr.ph75.split.us.new.preheader, %.lr.ph75.split.us.new.prol
  %.unr189.ph = phi double [ %37, %.lr.ph75.split.us.new.prol ], [ %.pre, %.lr.ph75.split.us.new.preheader ]
  %indvars.iv150.unr.ph190 = phi i64 [ %indvars.iv.next151.1.prol, %.lr.ph75.split.us.new.prol ], [ %indvars.iv150.unr.ph, %.lr.ph75.split.us.new.preheader ]
  br label %.lr.ph75.split.us.new.prol.loopexit

.lr.ph75.split.us.new.prol.loopexit:              ; preds = %.lr.ph75.split.us.new.prol.loopexit.unr-lcssa
  %38 = icmp eq i64 %30, 0
  br i1 %38, label %._crit_edge70.us.loopexit, label %.lr.ph75.split.us.new.preheader.new

.lr.ph75.split.us.new.preheader.new:              ; preds = %.lr.ph75.split.us.new.prol.loopexit
  br label %.lr.ph75.split.us.new

.lr.ph75.split.us.new:                            ; preds = %.lr.ph75.split.us.new, %.lr.ph75.split.us.new.preheader.new
  %39 = phi double [ %.unr189.ph, %.lr.ph75.split.us.new.preheader.new ], [ %51, %.lr.ph75.split.us.new ]
  %indvars.iv150 = phi i64 [ %indvars.iv150.unr.ph190, %.lr.ph75.split.us.new.preheader.new ], [ %indvars.iv.next151.1.1, %.lr.ph75.split.us.new ]
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv150, i64 %24
  %41 = load double, double* %40, align 8
  %42 = fadd double %41, %39
  store double %42, double* %sunkaddr100, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next151, i64 %24
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %sunkaddr100, align 8
  %indvars.iv.next151.1 = add nsw i64 %indvars.iv150, 2
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next151.1, i64 %24
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %45
  store double %48, double* %sunkaddr100, align 8
  %indvars.iv.next151.1191 = add nsw i64 %indvars.iv150, 3
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next151.1191, i64 %24
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  store double %51, double* %sunkaddr100, align 8
  %indvars.iv.next151.1.1 = add nsw i64 %indvars.iv150, 4
  %exitcond.1158.1 = icmp eq i64 %indvars.iv.next151.1.1, %wide.trip.count152.1
  br i1 %exitcond.1158.1, label %._crit_edge70.us.loopexit.unr-lcssa, label %.lr.ph75.split.us.new

._crit_edge70.us.loopexit.unr-lcssa:              ; preds = %.lr.ph75.split.us.new
  br label %._crit_edge70.us.loopexit

._crit_edge70.us.loopexit:                        ; preds = %.lr.ph75.split.us.new.prol.loopexit, %._crit_edge70.us.loopexit.unr-lcssa
  br label %._crit_edge70.us

._crit_edge70.us:                                 ; preds = %._crit_edge70.us.loopexit, %.prol.loopexit154
  %52 = getelementptr inbounds double, double* %5, i64 %24
  %53 = load double, double* %52, align 8
  %54 = fdiv double %53, %2
  store double %54, double* %52, align 8
  %55 = add nsw i32 %21, 1
  %56 = icmp slt i32 %55, %0
  br i1 %56, label %.lr.ph75.split.us, label %..preheader11_crit_edge.loopexit

..preheader11_crit_edge.loopexit:                 ; preds = %._crit_edge70.us
  br label %..preheader11_crit_edge

..preheader11_crit_edge.loopexit178.unr-lcssa:    ; preds = %.lr.ph75.split
  br label %..preheader11_crit_edge.loopexit178

..preheader11_crit_edge.loopexit178:              ; preds = %.lr.ph75.split.prol.loopexit, %..preheader11_crit_edge.loopexit178.unr-lcssa
  br label %..preheader11_crit_edge

..preheader11_crit_edge:                          ; preds = %..preheader11_crit_edge.loopexit178, %..preheader11_crit_edge.loopexit
  br i1 true, label %.lr.ph62, label %..preheader11_crit_edge..preheader11..preheader10_crit_edge_crit_edge

..preheader11_crit_edge..preheader11..preheader10_crit_edge_crit_edge: ; preds = %..preheader11_crit_edge
  br label %.preheader11..preheader10_crit_edge

.lr.ph62:                                         ; preds = %..preheader11_crit_edge
  %57 = load double*, double** %12, align 8
  %58 = load double, double* %8, align 8
  %59 = load double, double* %13, align 8
  %60 = load [1200 x double]*, [1200 x double]** %9, align 8
  %61 = bitcast double** %11 to i64*
  %62 = load i64, i64* %61, align 8
  %63 = ptrtoint double* %57 to i64
  br i1 %15, label %.lr.ph62.split.us.preheader, label %.lr.ph62.split.preheader

.lr.ph62.split.preheader:                         ; preds = %.lr.ph62
  %64 = sext i32 %0 to i64
  br label %.lr.ph62.split

.lr.ph62.split.us.preheader:                      ; preds = %.lr.ph62
  %65 = sext i32 %1 to i64
  %xtraiter185 = and i64 %65, 1
  %lcmp.mod186 = icmp eq i64 %xtraiter185, 0
  %66 = icmp eq i32 %1, 1
  br label %.lr.ph62.split.us

.lr.ph62.split.us:                                ; preds = %.lr.ph62.split.us.preheader, %.preheader11.us
  %67 = phi i32 [ %80, %.preheader11.us ], [ 0, %.lr.ph62.split.us.preheader ]
  %storemerge161.us = phi i32 [ %80, %.preheader11.us ], [ 0, %.lr.ph62.split.us.preheader ]
  %68 = sext i32 %storemerge161.us to i64
  %69 = getelementptr inbounds double, double* %57, i64 %68
  store double 0.000000e+00, double* %69, align 8
  %70 = sext i32 %67 to i64
  %sunkaddr102 = shl nsw i64 %70, 3
  %sunkaddr103 = add i64 %62, %sunkaddr102
  %sunkaddr104 = inttoptr i64 %sunkaddr103 to double*
  %sunkaddr107 = add i64 %63, %sunkaddr102
  %sunkaddr108 = inttoptr i64 %sunkaddr107 to double*
  %.pre176 = load double, double* %sunkaddr108, align 8
  br i1 %lcmp.mod186, label %.prol.loopexit184.unr-lcssa, label %.prol.preheader183

.prol.preheader183:                               ; preds = %.lr.ph62.split.us
  br label %71

; <label>:71:                                     ; preds = %.prol.preheader183
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %60, i64 0, i64 %70
  %73 = load double, double* %72, align 8
  %74 = load double, double* %sunkaddr104, align 8
  %75 = fsub double %73, %74
  %76 = fmul double %75, %75
  %77 = fadd double %.pre176, %76
  store double %77, double* %sunkaddr108, align 8
  br label %.prol.loopexit184.unr-lcssa

.prol.loopexit184.unr-lcssa:                      ; preds = %.lr.ph62.split.us, %71
  %.unr.ph = phi double [ %77, %71 ], [ %.pre176, %.lr.ph62.split.us ]
  %indvars.iv143.unr.ph = phi i64 [ 1, %71 ], [ 0, %.lr.ph62.split.us ]
  br label %.prol.loopexit184

.prol.loopexit184:                                ; preds = %.prol.loopexit184.unr-lcssa
  br i1 %66, label %._crit_edge58.us, label %.lr.ph62.split.us.new

.lr.ph62.split.us.new:                            ; preds = %.prol.loopexit184
  br label %82

; <label>:78:                                     ; preds = %._crit_edge58.us
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge58.us, %78
  %79 = phi double [ %100, %78 ], [ 1.000000e+00, %._crit_edge58.us ]
  store double %79, double* %97, align 8
  %80 = add nsw i32 %67, 1
  %81 = icmp slt i32 %80, %0
  br i1 %81, label %.lr.ph62.split.us, label %.preheader11..preheader11..preheader10_crit_edge_crit_edge.loopexit

; <label>:82:                                     ; preds = %82, %.lr.ph62.split.us.new
  %83 = phi double [ %.unr.ph, %.lr.ph62.split.us.new ], [ %95, %82 ]
  %indvars.iv143 = phi i64 [ %indvars.iv143.unr.ph, %.lr.ph62.split.us.new ], [ %indvars.iv.next144.1, %82 ]
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %60, i64 %indvars.iv143, i64 %70
  %85 = load double, double* %84, align 8
  %86 = load double, double* %sunkaddr104, align 8
  %87 = fsub double %85, %86
  %88 = fmul double %87, %87
  %89 = fadd double %83, %88
  store double %89, double* %sunkaddr108, align 8
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %60, i64 %indvars.iv.next144, i64 %70
  %91 = load double, double* %90, align 8
  %92 = load double, double* %sunkaddr104, align 8
  %93 = fsub double %91, %92
  %94 = fmul double %93, %93
  %95 = fadd double %89, %94
  store double %95, double* %sunkaddr108, align 8
  %indvars.iv.next144.1 = add nsw i64 %indvars.iv143, 2
  %96 = icmp slt i64 %indvars.iv.next144.1, %65
  br i1 %96, label %82, label %._crit_edge58.us.unr-lcssa

._crit_edge58.us.unr-lcssa:                       ; preds = %82
  br label %._crit_edge58.us

._crit_edge58.us:                                 ; preds = %.prol.loopexit184, %._crit_edge58.us.unr-lcssa
  %97 = getelementptr inbounds double, double* %57, i64 %70
  %98 = load double, double* %97, align 8
  %99 = fdiv double %98, %58
  store double %99, double* %97, align 8
  %100 = tail call double @sqrt(double %99) #4
  store double %100, double* %97, align 8
  %101 = fcmp ugt double %100, %59
  br i1 %101, label %78, label %.preheader11.us

.lr.ph75.split:                                   ; preds = %.lr.ph75.split, %.lr.ph75.split.preheader.new
  %indvars.iv160 = phi i64 [ %indvars.iv160.unr, %.lr.ph75.split.preheader.new ], [ %indvars.iv.next161.1, %.lr.ph75.split ]
  %storemerge73 = phi i64 [ %storemerge73.unr, %.lr.ph75.split.preheader.new ], [ %indvars.iv.next161.1, %.lr.ph75.split ]
  %sext163 = shl i64 %storemerge73, 32
  %102 = ashr exact i64 %sext163, 32
  %103 = getelementptr inbounds double, double* %5, i64 %102
  store double 0.000000e+00, double* %103, align 8
  %104 = getelementptr inbounds double, double* %5, i64 %indvars.iv160
  %105 = load double, double* %104, align 8
  %106 = fdiv double %105, %2
  store double %106, double* %104, align 8
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %sext163.1 = shl i64 %indvars.iv.next161, 32
  %107 = ashr exact i64 %sext163.1, 32
  %108 = getelementptr inbounds double, double* %5, i64 %107
  store double 0.000000e+00, double* %108, align 8
  %109 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next161
  %110 = load double, double* %109, align 8
  %111 = fdiv double %110, %2
  store double %111, double* %109, align 8
  %indvars.iv.next161.1 = add nsw i64 %indvars.iv160, 2
  %112 = icmp slt i64 %indvars.iv.next161.1, %18
  br i1 %112, label %.lr.ph75.split, label %..preheader11_crit_edge.loopexit178.unr-lcssa

.preheader11..preheader11..preheader10_crit_edge_crit_edge.loopexit111: ; preds = %.preheader11
  br label %.preheader11..preheader11..preheader10_crit_edge_crit_edge

.preheader11..preheader11..preheader10_crit_edge_crit_edge.loopexit: ; preds = %.preheader11.us
  br label %.preheader11..preheader11..preheader10_crit_edge_crit_edge

.preheader11..preheader11..preheader10_crit_edge_crit_edge: ; preds = %.preheader11..preheader11..preheader10_crit_edge_crit_edge.loopexit, %.preheader11..preheader11..preheader10_crit_edge_crit_edge.loopexit111
  br label %.preheader11..preheader10_crit_edge

.preheader11..preheader10_crit_edge:              ; preds = %..preheader11_crit_edge..preheader11..preheader10_crit_edge_crit_edge, %..preheader11_crit_edge.thread, %.preheader11..preheader11..preheader10_crit_edge_crit_edge
  %113 = icmp sgt i32 %1, 0
  br i1 %113, label %.preheader10..preheader9_crit_edge.lr.ph, label %.preheader10..preheader_crit_edge

.preheader10..preheader9_crit_edge.lr.ph:         ; preds = %.preheader11..preheader10_crit_edge
  %114 = load double*, double** %11, align 8
  %115 = load [1200 x double]*, [1200 x double]** %9, align 8
  %116 = load double, double* %8, align 8
  %117 = load double*, double** %12, align 8
  br i1 %14, label %.preheader10..preheader9_crit_edge.us.preheader, label %.preheader10..preheader10..preheader_crit_edge_crit_edge.loopexit110

.preheader10..preheader9_crit_edge.us.preheader:  ; preds = %.preheader10..preheader9_crit_edge.lr.ph
  %118 = sext i32 %0 to i64
  br label %.preheader10..preheader9_crit_edge.us

.preheader10..preheader9_crit_edge.us:            ; preds = %.preheader10..preheader9_crit_edge.us.preheader, %.preheader9._crit_edge.us
  %119 = phi i32 [ %133, %.preheader9._crit_edge.us ], [ 0, %.preheader10..preheader9_crit_edge.us.preheader ]
  %120 = sext i32 %119 to i64
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.preheader10..preheader9_crit_edge.us, %.preheader9.us
  %indvars.iv141 = phi i64 [ 0, %.preheader10..preheader9_crit_edge.us ], [ %indvars.iv.next142, %.preheader9.us ]
  %121 = getelementptr inbounds double, double* %114, i64 %indvars.iv141
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %115, i64 %120, i64 %indvars.iv141
  %124 = load double, double* %123, align 8
  %125 = fsub double %124, %122
  store double %125, double* %123, align 8
  %126 = tail call double @sqrt(double %116) #4
  %127 = getelementptr inbounds double, double* %117, i64 %indvars.iv141
  %128 = load double, double* %127, align 8
  %129 = fmul double %126, %128
  %130 = load double, double* %123, align 8
  %131 = fdiv double %130, %129
  store double %131, double* %123, align 8
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %132 = icmp slt i64 %indvars.iv.next142, %118
  br i1 %132, label %.preheader9.us, label %.preheader9._crit_edge.us

.preheader9._crit_edge.us:                        ; preds = %.preheader9.us
  %133 = add nsw i32 %119, 1
  %134 = icmp slt i32 %133, %1
  br i1 %134, label %.preheader10..preheader9_crit_edge.us, label %.preheader10..preheader10..preheader_crit_edge_crit_edge.loopexit

.lr.ph62.split:                                   ; preds = %.lr.ph62.split.preheader, %.preheader11
  %indvars.iv147 = phi i64 [ 0, %.lr.ph62.split.preheader ], [ %indvars.iv.next148, %.preheader11 ]
  %storemerge161 = phi i64 [ 0, %.lr.ph62.split.preheader ], [ %indvars.iv.next148, %.preheader11 ]
  %sext = shl i64 %storemerge161, 32
  %135 = ashr exact i64 %sext, 32
  %136 = getelementptr inbounds double, double* %57, i64 %135
  store double 0.000000e+00, double* %136, align 8
  %137 = getelementptr inbounds double, double* %57, i64 %indvars.iv147
  %138 = load double, double* %137, align 8
  %139 = fdiv double %138, %58
  store double %139, double* %137, align 8
  %140 = tail call double @sqrt(double %139) #4
  store double %140, double* %137, align 8
  %141 = fcmp ugt double %140, %59
  br i1 %141, label %142, label %.preheader11

; <label>:142:                                    ; preds = %.lr.ph62.split
  br label %.preheader11

.preheader11:                                     ; preds = %.lr.ph62.split, %142
  %143 = phi double [ %140, %142 ], [ 1.000000e+00, %.lr.ph62.split ]
  store double %143, double* %137, align 8
  %indvars.iv.next148 = add nsw i64 %indvars.iv147, 1
  %144 = icmp slt i64 %indvars.iv.next148, %64
  br i1 %144, label %.lr.ph62.split, label %.preheader11..preheader11..preheader10_crit_edge_crit_edge.loopexit111

.preheader10..preheader10..preheader_crit_edge_crit_edge.loopexit: ; preds = %.preheader9._crit_edge.us
  br label %.preheader10..preheader10..preheader_crit_edge_crit_edge

.preheader10..preheader10..preheader_crit_edge_crit_edge.loopexit110: ; preds = %.preheader10..preheader9_crit_edge.lr.ph
  br label %.preheader10..preheader10..preheader_crit_edge_crit_edge

.preheader10..preheader10..preheader_crit_edge_crit_edge: ; preds = %.preheader10..preheader10..preheader_crit_edge_crit_edge.loopexit110, %.preheader10..preheader10..preheader_crit_edge_crit_edge.loopexit
  br label %.preheader10..preheader_crit_edge

.preheader10..preheader_crit_edge:                ; preds = %.preheader10..preheader10..preheader_crit_edge_crit_edge, %.preheader11..preheader10_crit_edge
  %145 = add nsw i32 %0, -1
  %146 = icmp sgt i32 %0, 1
  %147 = load [1200 x double]*, [1200 x double]** %10, align 8
  br i1 %146, label %.lr.ph27, label %205

.lr.ph27:                                         ; preds = %.preheader10..preheader_crit_edge
  %148 = load [1200 x double]*, [1200 x double]** %9, align 8
  br i1 %113, label %.lr.ph27.split.us.preheader, label %.lr.ph27.split.preheader

.lr.ph27.split.preheader:                         ; preds = %.lr.ph27
  %149 = add i32 %0, 1
  %150 = add i32 %0, -2
  %151 = sext i32 %145 to i64
  br label %.lr.ph27.split

.lr.ph27.split.us.preheader:                      ; preds = %.lr.ph27
  %152 = sext i32 %145 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %153 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph27.split.us

.lr.ph27.split.us:                                ; preds = %.lr.ph27.split.us.preheader, %.preheader.us
  %indvars.iv127 = phi i64 [ 0, %.lr.ph27.split.us.preheader ], [ %indvars.iv.next128, %.preheader.us ]
  %storemerge326.us = phi i32 [ 0, %.lr.ph27.split.us.preheader ], [ %159, %.preheader.us ]
  %154 = sext i32 %storemerge326.us to i64
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %147, i64 %154, i64 %154
  store double 1.000000e+00, double* %155, align 8
  %storemerge417.us = add nsw i32 %storemerge326.us, 1
  %156 = icmp slt i32 %storemerge417.us, %0
  br i1 %156, label %.lr.ph.us.us.preheader, label %.preheader.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph27.split.us
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %148, i64 0, i64 %indvars.iv127
  br label %.lr.ph.us.us

.preheader.us.loopexit:                           ; preds = %._crit_edge15.us.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.loopexit, %.lr.ph27.split.us
  %indvars.iv.next128 = add nsw i64 %indvars.iv127, 1
  %158 = icmp slt i64 %indvars.iv.next128, %152
  %159 = trunc i64 %indvars.iv.next128 to i32
  br i1 %158, label %.lr.ph27.split.us, label %.preheader._crit_edge.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge15.us.us
  %storemerge423.us.us = phi i32 [ %storemerge4.us.us, %._crit_edge15.us.us ], [ %storemerge417.us, %.lr.ph.us.us.preheader ]
  %160 = sext i32 %storemerge423.us.us to i64
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %147, i64 %indvars.iv127, i64 %160
  store double 0.000000e+00, double* %161, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %162 = load double, double* %157, align 8
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %148, i64 0, i64 %160
  %164 = load double, double* %163, align 8
  %165 = fmul double %162, %164
  %166 = fadd double %165, 0.000000e+00
  store double %166, double* %161, align 8
  %167 = bitcast double %166 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %168 = phi i64 [ %167, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %169 = phi double [ %166, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %153, label %._crit_edge15.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge15.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %170 = bitcast double %187 to i64
  br label %._crit_edge15.us.us

._crit_edge15.us.us:                              ; preds = %._crit_edge15.us.us.loopexit, %.prol.loopexit
  %171 = phi i64 [ %168, %.prol.loopexit ], [ %170, %._crit_edge15.us.us.loopexit ]
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %147, i64 %160, i64 %indvars.iv127
  %173 = bitcast double* %172 to i64*
  store i64 %171, i64* %173, align 8
  %storemerge4.us.us = add nsw i32 %storemerge423.us.us, 1
  %174 = icmp slt i32 %storemerge4.us.us, %0
  br i1 %174, label %.lr.ph.us.us, label %.preheader.us.loopexit

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %175 = phi double [ %187, %.lr.ph.us.us.new ], [ %169, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %148, i64 %indvars.iv, i64 %indvars.iv127
  %177 = load double, double* %176, align 8
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %148, i64 %indvars.iv, i64 %160
  %179 = load double, double* %178, align 8
  %180 = fmul double %177, %179
  %181 = fadd double %180, %175
  store double %181, double* %161, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %148, i64 %indvars.iv.next, i64 %indvars.iv127
  %183 = load double, double* %182, align 8
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %148, i64 %indvars.iv.next, i64 %160
  %185 = load double, double* %184, align 8
  %186 = fmul double %183, %185
  %187 = fadd double %186, %181
  store double %187, double* %161, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge15.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph27.split:                                   ; preds = %.lr.ph27.split.preheader, %.preheader
  %indvars.iv139 = phi i64 [ 0, %.lr.ph27.split.preheader ], [ %indvars.iv.next140, %.preheader ]
  %storemerge326 = phi i32 [ 0, %.lr.ph27.split.preheader ], [ %204, %.preheader ]
  %188 = sext i32 %storemerge326 to i64
  %189 = getelementptr inbounds [1200 x double], [1200 x double]* %147, i64 %188, i64 %188
  store double 1.000000e+00, double* %189, align 8
  %storemerge417 = add nsw i32 %storemerge326, 1
  %190 = icmp slt i32 %storemerge417, %0
  br i1 %190, label %.lr.ph20, label %.preheader

.lr.ph20:                                         ; preds = %.lr.ph27.split
  %191 = sext i32 %storemerge417 to i64
  %192 = sub i32 %149, %storemerge326
  %xtraiter135 = and i32 %192, 1
  %lcmp.mod136 = icmp eq i32 %xtraiter135, 0
  br i1 %lcmp.mod136, label %.prol.loopexit134, label %.prol.preheader133

.prol.preheader133:                               ; preds = %.lr.ph20
  %193 = getelementptr inbounds [1200 x double], [1200 x double]* %147, i64 %indvars.iv139, i64 %191
  store double 0.000000e+00, double* %193, align 8
  %194 = getelementptr inbounds [1200 x double], [1200 x double]* %147, i64 %191, i64 %indvars.iv139
  %195 = bitcast double* %194 to i64*
  store i64 0, i64* %195, align 8
  %indvars.iv.next130.prol = add nsw i64 %191, 1
  br label %.prol.loopexit134

.prol.loopexit134:                                ; preds = %.prol.preheader133, %.lr.ph20
  %indvars.iv129.unr.ph = phi i64 [ %indvars.iv.next130.prol, %.prol.preheader133 ], [ %191, %.lr.ph20 ]
  %196 = icmp eq i32 %150, %storemerge326
  br i1 %196, label %.preheader, label %.lr.ph20.new.preheader

.lr.ph20.new.preheader:                           ; preds = %.prol.loopexit134
  br label %.lr.ph20.new

.lr.ph20.new:                                     ; preds = %.lr.ph20.new.preheader, %.lr.ph20.new
  %indvars.iv129 = phi i64 [ %indvars.iv.next130.1, %.lr.ph20.new ], [ %indvars.iv129.unr.ph, %.lr.ph20.new.preheader ]
  %197 = getelementptr inbounds [1200 x double], [1200 x double]* %147, i64 %indvars.iv139, i64 %indvars.iv129
  store double 0.000000e+00, double* %197, align 8
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %147, i64 %indvars.iv129, i64 %indvars.iv139
  %199 = bitcast double* %198 to i64*
  store i64 0, i64* %199, align 8
  %indvars.iv.next130 = add nsw i64 %indvars.iv129, 1
  %200 = getelementptr inbounds [1200 x double], [1200 x double]* %147, i64 %indvars.iv139, i64 %indvars.iv.next130
  store double 0.000000e+00, double* %200, align 8
  %201 = getelementptr inbounds [1200 x double], [1200 x double]* %147, i64 %indvars.iv.next130, i64 %indvars.iv139
  %202 = bitcast double* %201 to i64*
  store i64 0, i64* %202, align 8
  %indvars.iv.next130.1 = add nsw i64 %indvars.iv129, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next130.1 to i32
  %exitcond.1138 = icmp eq i32 %lftr.wideiv.1, %0
  br i1 %exitcond.1138, label %.preheader.loopexit, label %.lr.ph20.new

.preheader.loopexit:                              ; preds = %.lr.ph20.new
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit134, %.lr.ph27.split
  %indvars.iv.next140 = add nsw i64 %indvars.iv139, 1
  %203 = icmp slt i64 %indvars.iv.next140, %151
  %204 = trunc i64 %indvars.iv.next140 to i32
  br i1 %203, label %.lr.ph27.split, label %.preheader._crit_edge.loopexit177

.preheader._crit_edge.loopexit:                   ; preds = %.preheader.us
  br label %.preheader._crit_edge

.preheader._crit_edge.loopexit177:                ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit177, %.preheader._crit_edge.loopexit
  br label %205

; <label>:205:                                    ; preds = %.preheader._crit_edge, %.preheader10..preheader_crit_edge
  %206 = sext i32 %145 to i64
  %207 = getelementptr inbounds [1200 x double], [1200 x double]* %147, i64 %206, i64 %206
  store double 1.000000e+00, double* %207, align 8
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %..preheader_crit_edge.lr.ph, label %25

..preheader_crit_edge.lr.ph:                      ; preds = %2
  br i1 true, label %..preheader_crit_edge.us.preheader, label %._crit_edge4.loopexit11

..preheader_crit_edge.us.preheader:               ; preds = %..preheader_crit_edge.lr.ph
  %wide.trip.count = zext i32 %0 to i64
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.preheader, %.preheader._crit_edge.us
  %8 = phi i32 [ %23, %.preheader._crit_edge.us ], [ 0, %..preheader_crit_edge.us.preheader ]
  %9 = sext i32 %8 to i64
  %10 = mul nsw i32 %8, %0
  %11 = zext i32 %10 to i64
  br label %12

; <label>:12:                                     ; preds = %.preheader.us, %..preheader_crit_edge.us
  %indvars.iv = phi i64 [ 0, %..preheader_crit_edge.us ], [ %indvars.iv.next, %.preheader.us ]
  %13 = add i64 %11, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %.preheader.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %12, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %9, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.preheader._crit_edge.us, label %12

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %23 = add nsw i32 %8, 1
  %24 = icmp slt i32 %23, %0
  br i1 %24, label %..preheader_crit_edge.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit11:                          ; preds = %..preheader_crit_edge.lr.ph
  br label %._crit_edge4

._crit_edge4.loopexit:                            ; preds = %.preheader._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %._crit_edge4.loopexit11
  br label %25

; <label>:25:                                     ; preds = %._crit_edge4, %2
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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

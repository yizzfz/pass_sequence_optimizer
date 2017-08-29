; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.lr.ph109:
  br label %.lr.ph101

.lr.ph101:                                        ; preds = %.thread, %.lr.ph109
  %indvars.iv174 = phi i64 [ 0, %.lr.ph109 ], [ %indvars.iv.next175, %.thread ]
  %1 = shl i64 %indvars.iv174, 32
  %sext = add i64 %1, 4294967296
  %2 = sub i64 1998, %indvars.iv174
  %3 = shl i64 %2, 3
  br label %4

; <label>:4:                                      ; preds = %4, %.lr.ph101
  %indvars.iv161 = phi i64 [ 0, %.lr.ph101 ], [ %indvars.iv.next162, %4 ]
  %5 = sub nsw i64 0, %indvars.iv161
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 2000
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fadd double %9, 1.000000e+00
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv174, i64 %indvars.iv161
  store double %10, double* %11, align 8
  %indvars.iv.next162 = add nuw nsw i64 %indvars.iv161, 1
  %exitcond165 = icmp eq i64 %indvars.iv161, %indvars.iv174
  br i1 %exitcond165, label %12, label %4

; <label>:12:                                     ; preds = %4
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %13 = icmp slt i64 %indvars.iv.next175, 2000
  br i1 %13, label %.thread, label %.lr.ph93.us.preheader

.thread:                                          ; preds = %12
  %14 = and i64 %3, 34359738360
  %15 = ashr exact i64 %sext, 32
  %16 = add nuw nsw i64 %14, 8
  %scevgep172 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv174, i64 %15
  %17 = bitcast double* %scevgep172 to i8*
  call void @llvm.memset.p0i8.i64(i8* %17, i8 0, i64 %16, i32 8, i1 false)
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv174, i64 %indvars.iv174
  store double 1.000000e+00, double* %18, align 8
  br label %.lr.ph101

.lr.ph93.us.preheader:                            ; preds = %12
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv174, i64 %indvars.iv174
  store double 1.000000e+00, double* %19, align 8
  %20 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %21

; <label>:21:                                     ; preds = %21, %.lr.ph93.us.preheader
  %indvars.iv159 = phi i64 [ 0, %.lr.ph93.us.preheader ], [ %indvars.iv.next160.7, %21 ]
  %22 = mul nuw nsw i64 %indvars.iv159, 16000
  %scevgep = getelementptr i8, i8* %20, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next160 = or i64 %indvars.iv159, 1
  %23 = mul nuw nsw i64 %indvars.iv.next160, 16000
  %scevgep.1 = getelementptr i8, i8* %20, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next160.1 = or i64 %indvars.iv159, 2
  %24 = mul nuw nsw i64 %indvars.iv.next160.1, 16000
  %scevgep.2 = getelementptr i8, i8* %20, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next160.2 = or i64 %indvars.iv159, 3
  %25 = mul nuw nsw i64 %indvars.iv.next160.2, 16000
  %scevgep.3 = getelementptr i8, i8* %20, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next160.3 = or i64 %indvars.iv159, 4
  %26 = mul nuw nsw i64 %indvars.iv.next160.3, 16000
  %scevgep.4 = getelementptr i8, i8* %20, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next160.4 = or i64 %indvars.iv159, 5
  %27 = mul nuw nsw i64 %indvars.iv.next160.4, 16000
  %scevgep.5 = getelementptr i8, i8* %20, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next160.5 = or i64 %indvars.iv159, 6
  %28 = mul nuw nsw i64 %indvars.iv.next160.5, 16000
  %scevgep.6 = getelementptr i8, i8* %20, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next160.6 = or i64 %indvars.iv159, 7
  %29 = mul nuw nsw i64 %indvars.iv.next160.6, 16000
  %scevgep.7 = getelementptr i8, i8* %20, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next160.7 = add nsw i64 %indvars.iv159, 8
  %exitcond7.7 = icmp eq i64 %indvars.iv.next160.7, 2000
  br i1 %exitcond7.7, label %.lr.ph75.us.us.preheader.preheader, label %21

.lr.ph75.us.us.preheader.preheader:               ; preds = %21
  %30 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %31 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %.lr.ph75.us.us.preheader

; <label>:32:                                     ; preds = %40
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next155, 2000
  br i1 %exitcond6, label %.lr.ph.us.preheader, label %.lr.ph75.us.us.preheader

.lr.ph.us.preheader:                              ; preds = %32
  %33 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %34 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %38 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %39 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %.lr.ph.us

.lr.ph75.us.us.preheader:                         ; preds = %.lr.ph75.us.us.preheader.preheader, %32
  %indvars.iv154 = phi i64 [ %indvars.iv.next155, %32 ], [ 0, %.lr.ph75.us.us.preheader.preheader ]
  %sunkaddr8 = shl i64 %indvars.iv154, 3
  %sunkaddr8.1 = shl i64 %indvars.iv154, 3
  br label %.lr.ph75.us.us

; <label>:40:                                     ; preds = %42
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next153, 2000
  br i1 %exitcond5, label %32, label %.lr.ph75.us.us

.lr.ph75.us.us:                                   ; preds = %40, %.lr.ph75.us.us.preheader
  %indvars.iv152 = phi i64 [ 0, %.lr.ph75.us.us.preheader ], [ %indvars.iv.next153, %40 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv152
  %sunkaddr = ptrtoint [2000 x double]* %41 to i64
  %sunkaddr9 = add i64 %sunkaddr, %sunkaddr8
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to double*
  %sunkaddr.1 = ptrtoint [2000 x double]* %41 to i64
  %sunkaddr9.1 = add i64 %sunkaddr.1, %sunkaddr8.1
  %sunkaddr10.1 = inttoptr i64 %sunkaddr9.1 to double*
  br label %42

; <label>:42:                                     ; preds = %42, %.lr.ph75.us.us
  %indvars.iv149 = phi i64 [ 0, %.lr.ph75.us.us ], [ %indvars.iv.next150.1, %42 ]
  %43 = load double, double* %sunkaddr10, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv149, i64 %indvars.iv154
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv152, i64 %indvars.iv149
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  store double %49, double* %47, align 8
  %indvars.iv.next150 = or i64 %indvars.iv149, 1
  %50 = load double, double* %sunkaddr10.1, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next150, i64 %indvars.iv154
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv152, i64 %indvars.iv.next150
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  store double %56, double* %54, align 8
  %indvars.iv.next150.1 = add nsw i64 %indvars.iv149, 2
  %exitcond151.1 = icmp eq i64 %indvars.iv.next150, 1999
  br i1 %exitcond151.1, label %40, label %42

.loopexit.loopexit:                               ; preds = %scalar.ph
  br label %.loopexit

.loopexit.loopexit20:                             ; preds = %vector.body
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit20, %.loopexit.loopexit
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next147, 2000
  br i1 %exitcond4, label %102, label %.lr.ph.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next.4, %scalar.ph ]
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv146, i64 %indvars.iv
  %58 = bitcast double* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv146, i64 %indvars.iv
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv146, i64 %indvars.iv.next
  %63 = bitcast double* %62 to i64*
  %64 = load i64, i64* %63, align 8
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv146, i64 %indvars.iv.next
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv146, i64 %indvars.iv.next.1
  %68 = bitcast double* %67 to i64*
  %69 = load i64, i64* %68, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv146, i64 %indvars.iv.next.1
  %71 = bitcast double* %70 to i64*
  store i64 %69, i64* %71, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv146, i64 %indvars.iv.next.2
  %73 = bitcast double* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv146, i64 %indvars.iv.next.2
  %76 = bitcast double* %75 to i64*
  store i64 %74, i64* %76, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv146, i64 %indvars.iv.next.3
  %78 = bitcast double* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv146, i64 %indvars.iv.next.3
  %81 = bitcast double* %80 to i64*
  store i64 %79, i64* %81, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %.loopexit.loopexit, label %scalar.ph, !llvm.loop !1

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %.loopexit
  %indvars.iv146 = phi i64 [ %indvars.iv.next147, %.loopexit ], [ 0, %.lr.ph.us.preheader ]
  %scevgep11 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv146, i64 0
  %scevgep1112 = bitcast double* %scevgep11 to i8*
  %82 = add nuw nsw i64 %indvars.iv146, 1
  %scevgep13 = getelementptr [2000 x double], [2000 x double]* %0, i64 %82, i64 0
  %scevgep1314 = bitcast double* %scevgep13 to i8*
  %83 = mul nuw nsw i64 %indvars.iv146, 16000
  %scevgep15 = getelementptr i8, i8* %20, i64 %83
  %84 = add nuw nsw i64 %83, 16000
  %scevgep16 = getelementptr i8, i8* %20, i64 %84
  %bound0 = icmp ult i8* %scevgep1112, %scevgep16
  %bound1 = icmp ult i8* %scevgep15, %scevgep1314
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.lr.ph.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv146, i64 %index
  %86 = bitcast double* %85 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %86, align 8, !alias.scope !4
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x i64>*
  %wide.load18 = load <2 x i64>, <2 x i64>* %88, align 8, !alias.scope !4
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv146, i64 %index
  %90 = bitcast double* %89 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %90, align 8, !alias.scope !7, !noalias !4
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x i64>*
  store <2 x i64> %wide.load18, <2 x i64>* %92, align 8, !alias.scope !7, !noalias !4
  %index.next = or i64 %index, 4
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv146, i64 %index.next
  %94 = bitcast double* %93 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !4
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load18.1 = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !4
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv146, i64 %index.next
  %98 = bitcast double* %97 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %98, align 8, !alias.scope !7, !noalias !4
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load18.1, <2 x i64>* %100, align 8, !alias.scope !7, !noalias !4
  %index.next.1 = add nsw i64 %index, 8
  %101 = icmp eq i64 %index.next.1, 2000
  br i1 %101, label %.loopexit.loopexit20, label %vector.body, !llvm.loop !9

; <label>:102:                                    ; preds = %.loopexit
  tail call void @free(i8* nonnull %20) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.lr.ph59.preheader:
  br label %.lr.ph59

.lr.ph59:                                         ; preds = %.lr.ph53.thread, %.lr.ph59.preheader
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %.lr.ph53.thread ], [ 0, %.lr.ph59.preheader ]
  %indvars.iv88 = phi i32 [ %indvars.iv.next89, %.lr.ph53.thread ], [ -1, %.lr.ph59.preheader ]
  %1 = add i64 %indvars.iv2, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = icmp sgt i64 %indvars.iv2, 0
  br i1 %3, label %.lr.ph45, label %.lr.ph53.thread

.lr.ph45:                                         ; preds = %.lr.ph59
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2
  %5 = ptrtoint [2000 x double]* %4 to i64
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 0
  %sunkaddr.prol = ptrtoint [2000 x double]* %4 to i64
  %sunkaddr = ptrtoint [2000 x double]* %4 to i64
  %sunkaddr.1 = ptrtoint [2000 x double]* %4 to i64
  br label %7

; <label>:7:                                      ; preds = %.loopexit, %.lr.ph45
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %.loopexit ], [ 0, %.lr.ph45 ]
  %indvars.iv81 = phi i32 [ %indvars.iv.next82, %.loopexit ], [ -1, %.lr.ph45 ]
  %8 = add i64 %indvars.iv83, 4294967295
  %9 = and i64 %8, 4294967295
  %10 = icmp sgt i64 %indvars.iv83, 0
  br i1 %10, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %7
  %sunkaddr61 = shl nsw i64 %indvars.iv83, 3
  %sunkaddr62 = add i64 %5, %sunkaddr61
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to double*
  %wide.trip.count = zext i32 %indvars.iv81 to i64
  %.pre = load double, double* %sunkaddr63, align 8
  %11 = and i64 %8, 1
  %lcmp.mod = icmp eq i64 %11, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %12 = load double, double* %6, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv83
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %.pre, %15
  %sunkaddr7.prol = shl i64 %indvars.iv83, 3
  %sunkaddr8.prol = add i64 %sunkaddr.prol, %sunkaddr7.prol
  %sunkaddr9.prol = inttoptr i64 %sunkaddr8.prol to double*
  store double %16, double* %sunkaddr9.prol, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.unr.ph = phi double [ %16, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %17 = icmp eq i64 %9, 0
  br i1 %17, label %.loopexit.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  %sunkaddr7 = shl i64 %indvars.iv83, 3
  %sunkaddr8 = add i64 %sunkaddr, %sunkaddr7
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to double*
  %sunkaddr7.1 = shl i64 %indvars.iv83, 3
  %sunkaddr8.1 = add i64 %sunkaddr.1, %sunkaddr7.1
  %sunkaddr9.1 = inttoptr i64 %sunkaddr8.1 to double*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %18 = phi double [ %.unr.ph, %.lr.ph.preheader.new ], [ %30, %.lr.ph ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv83
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  store double %24, double* %sunkaddr9, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv83
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %24, %29
  store double %30, double* %sunkaddr9.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph.prol.loopexit, %.loopexit.loopexit.unr-lcssa
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %7
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83, i64 %indvars.iv83
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv83
  %34 = load double, double* %33, align 8
  %35 = fdiv double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %indvars.iv.next82 = add nsw i32 %indvars.iv81, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next84, %indvars.iv2
  br i1 %exitcond4, label %.lr.ph49.us.preheader, label %7

.lr.ph49.us.preheader:                            ; preds = %.loopexit
  %wide.trip.count90 = zext i32 %indvars.iv88 to i64
  %36 = ptrtoint [2000 x double]* %4 to i64
  %37 = and i64 %1, 1
  %lcmp.mod15 = icmp eq i64 %37, 0
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 0
  %sunkaddr10.prol = ptrtoint [2000 x double]* %4 to i64
  %39 = icmp eq i64 %2, 0
  %sunkaddr10 = ptrtoint [2000 x double]* %4 to i64
  %sunkaddr10.1 = ptrtoint [2000 x double]* %4 to i64
  br label %.lr.ph49.us

.unr-lcssa:                                       ; preds = %41
  br label %40

; <label>:40:                                     ; preds = %.prol.loopexit, %.unr-lcssa
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next95, 2000
  br i1 %exitcond5, label %.lr.ph53.thread.loopexit, label %.lr.ph49.us

; <label>:41:                                     ; preds = %41, %.lr.ph49.us.new
  %42 = phi double [ %.unr16.ph, %.lr.ph49.us.new ], [ %54, %41 ]
  %indvars.iv86 = phi i64 [ %indvars.iv86.unr.ph, %.lr.ph49.us.new ], [ %indvars.iv.next87.1, %41 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv86
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv86, i64 %indvars.iv94
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %42, %47
  store double %48, double* %sunkaddr13, align 8
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next87
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next87, i64 %indvars.iv94
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fsub double %48, %53
  store double %54, double* %sunkaddr13.1, align 8
  %indvars.iv.next87.1 = add nsw i64 %indvars.iv86, 2
  %exitcond91.1 = icmp eq i64 %indvars.iv.next87, %wide.trip.count90
  br i1 %exitcond91.1, label %.unr-lcssa, label %41

.lr.ph49.us:                                      ; preds = %40, %.lr.ph49.us.preheader
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %40 ], [ %indvars.iv2, %.lr.ph49.us.preheader ]
  %sunkaddr65 = shl nsw i64 %indvars.iv94, 3
  %sunkaddr66 = add i64 %36, %sunkaddr65
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to double*
  %.pre1 = load double, double* %sunkaddr67, align 8
  br i1 %lcmp.mod15, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph49.us
  br label %55

; <label>:55:                                     ; preds = %.prol.preheader
  %56 = load double, double* %38, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv94
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fsub double %.pre1, %59
  %sunkaddr11.prol = shl i64 %indvars.iv94, 3
  %sunkaddr12.prol = add i64 %sunkaddr10.prol, %sunkaddr11.prol
  %sunkaddr13.prol = inttoptr i64 %sunkaddr12.prol to double*
  store double %60, double* %sunkaddr13.prol, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph49.us, %55
  %.unr16.ph = phi double [ %60, %55 ], [ %.pre1, %.lr.ph49.us ]
  %indvars.iv86.unr.ph = phi i64 [ 1, %55 ], [ 0, %.lr.ph49.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %39, label %40, label %.lr.ph49.us.new

.lr.ph49.us.new:                                  ; preds = %.prol.loopexit
  %sunkaddr11 = shl i64 %indvars.iv94, 3
  %sunkaddr12 = add i64 %sunkaddr10, %sunkaddr11
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to double*
  %sunkaddr11.1 = shl i64 %indvars.iv94, 3
  %sunkaddr12.1 = add i64 %sunkaddr10.1, %sunkaddr11.1
  %sunkaddr13.1 = inttoptr i64 %sunkaddr12.1 to double*
  br label %41

.lr.ph53.thread.loopexit:                         ; preds = %40
  br label %.lr.ph53.thread

.lr.ph53.thread:                                  ; preds = %.lr.ph53.thread.loopexit, %.lr.ph59
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %indvars.iv.next89 = add nsw i32 %indvars.iv88, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond6, label %61, label %.lr.ph59

; <label>:61:                                     ; preds = %.lr.ph53.thread
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph.us

; <label>:5:                                      ; preds = %13
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next20, 2000
  br i1 %exitcond2, label %19, label %.lr.ph.us

; <label>:6:                                      ; preds = %13, %.lr.ph.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next, %13 ]
  %7 = add nuw nsw i64 %indvars.iv, %18
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %5, label %6

.lr.ph.us:                                        ; preds = %5, %.lr.ph.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next20, %5 ]
  %18 = mul nuw nsw i64 %indvars.iv19, 2000
  br label %6

; <label>:19:                                     ; preds = %5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !2, !3}

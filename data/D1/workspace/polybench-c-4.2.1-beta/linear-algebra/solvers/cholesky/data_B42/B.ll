; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  br i1 true, label %.preheader73.lr.ph, label %._crit_edge102.thread

._crit_edge102.thread:                            ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge76

.preheader73.lr.ph:                               ; preds = %2
  br label %.lr.ph95

.lr.ph95:                                         ; preds = %._crit_edge100, %.preheader73.lr.ph
  %indvars.iv149 = phi i64 [ 0, %.preheader73.lr.ph ], [ %indvars.iv.next150, %._crit_edge100 ]
  %indvars.iv147 = phi i64 [ 1, %.preheader73.lr.ph ], [ %indvars.iv.next148, %._crit_edge100 ]
  %4 = mul nuw nsw i64 %indvars.iv149, 2001
  %5 = add nuw nsw i64 %4, 1
  %scevgep143 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  %6 = sub i64 1998, %indvars.iv149
  %7 = shl i64 %6, 3
  %8 = and i64 %7, 34359738360
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph95
  %indvars.iv131 = phi i64 [ 0, %.lr.ph95 ], [ %indvars.iv.next132, %._crit_edge ]
  %9 = sub nsw i64 0, %indvars.iv131
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2000
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+03
  %14 = fadd double %13, 1.000000e+00
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv131
  store double %14, double* %15, align 8
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next132, %indvars.iv147
  br i1 %exitcond138, label %._crit_edge96, label %._crit_edge

._crit_edge96:                                    ; preds = %._crit_edge
  %scevgep143144 = bitcast double* %scevgep143 to i8*
  %16 = add nuw nsw i64 %8, 8
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %17 = icmp slt i64 %indvars.iv.next150, 2000
  br i1 %17, label %._crit_edge100.loopexit, label %._crit_edge100

._crit_edge100.loopexit:                          ; preds = %._crit_edge96
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep143144, i8 0, i64 %16, i32 8, i1 false)
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge96, %._crit_edge100.loopexit
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv149
  store double 1.000000e+00, double* %18, align 8
  %exitcond152 = icmp eq i64 %indvars.iv.next150, 2000
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  br i1 %exitcond152, label %._crit_edge102, label %.lr.ph95

._crit_edge102:                                   ; preds = %._crit_edge100
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %20 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br i1 true, label %._crit_edge92.us.prol.loopexit, label %._crit_edge92.us.prol.preheader

._crit_edge92.us.prol.preheader:                  ; preds = %._crit_edge102
  br label %._crit_edge92.us.prol

._crit_edge92.us.prol:                            ; preds = %._crit_edge92.us.prol, %._crit_edge92.us.prol.preheader
  %indvars.iv127.prol = phi i64 [ 0, %._crit_edge92.us.prol.preheader ], [ %indvars.iv.next128.prol, %._crit_edge92.us.prol ]
  %prol.iter205 = phi i64 [ 0, %._crit_edge92.us.prol.preheader ], [ %prol.iter205.sub, %._crit_edge92.us.prol ]
  %21 = mul nuw nsw i64 %indvars.iv127.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %19, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next128.prol = add nuw nsw i64 %indvars.iv127.prol, 1
  %prol.iter205.sub = add nsw i64 %prol.iter205, -1
  %prol.iter205.cmp = icmp eq i64 %prol.iter205.sub, 0
  br i1 %prol.iter205.cmp, label %._crit_edge92.us.prol.loopexit.unr-lcssa, label %._crit_edge92.us.prol, !llvm.loop !1

._crit_edge92.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge92.us.prol
  br label %._crit_edge92.us.prol.loopexit

._crit_edge92.us.prol.loopexit:                   ; preds = %._crit_edge102, %._crit_edge92.us.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader69.us.us.preheader.preheader, label %._crit_edge102.new

._crit_edge102.new:                               ; preds = %._crit_edge92.us.prol.loopexit
  br label %._crit_edge92.us

._crit_edge92.us:                                 ; preds = %._crit_edge92.us, %._crit_edge102.new
  %indvars.iv127 = phi i64 [ 0, %._crit_edge102.new ], [ %indvars.iv.next128.7, %._crit_edge92.us ]
  %22 = mul nuw nsw i64 %indvars.iv127, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %23 = mul i64 %indvars.iv127, 16000
  %24 = add i64 %23, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %25 = mul i64 %indvars.iv127, 16000
  %26 = add i64 %25, 32000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %27 = mul i64 %indvars.iv127, 16000
  %28 = add i64 %27, 48000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %29 = mul i64 %indvars.iv127, 16000
  %30 = add i64 %29, 64000
  %scevgep.4 = getelementptr i8, i8* %19, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %31 = mul i64 %indvars.iv127, 16000
  %32 = add i64 %31, 80000
  %scevgep.5 = getelementptr i8, i8* %19, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %33 = mul i64 %indvars.iv127, 16000
  %34 = add i64 %33, 96000
  %scevgep.6 = getelementptr i8, i8* %19, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %35 = mul i64 %indvars.iv127, 16000
  %36 = add i64 %35, 112000
  %scevgep.7 = getelementptr i8, i8* %19, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next128.7 = add nsw i64 %indvars.iv127, 8
  %exitcond130.7 = icmp eq i64 %indvars.iv.next128.7, 2000
  br i1 %exitcond130.7, label %.preheader69.us.us.preheader.preheader.unr-lcssa, label %._crit_edge92.us

.preheader69.us.us.preheader.preheader.unr-lcssa: ; preds = %._crit_edge92.us
  br label %.preheader69.us.us.preheader.preheader

.preheader69.us.us.preheader.preheader:           ; preds = %._crit_edge92.us.prol.loopexit, %.preheader69.us.us.preheader.preheader.unr-lcssa
  br label %.preheader69.us.us.preheader

.preheader69.us.us.preheader:                     ; preds = %.preheader69.us.us.preheader.preheader, %._crit_edge81.us
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %._crit_edge81.us ], [ 0, %.preheader69.us.us.preheader.preheader ]
  %scevgep160 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv119
  %scevgep160161 = bitcast double* %scevgep160 to i8*
  %37 = add nsw i64 %indvars.iv119, -1999
  %scevgep162 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %37
  %scevgep162163 = bitcast double* %scevgep162 to i8*
  br label %.preheader69.us.us

._crit_edge81.us:                                 ; preds = %._crit_edge79.us.us
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next120, 2000
  br i1 %exitcond122, label %.preheader.us.preheader, label %.preheader69.us.us.preheader

.preheader69.us.us:                               ; preds = %._crit_edge79.us.us, %.preheader69.us.us.preheader
  %indvars.iv115 = phi i64 [ 0, %.preheader69.us.us.preheader ], [ %indvars.iv.next116, %._crit_edge79.us.us ]
  %38 = mul nuw nsw i64 %indvars.iv115, 16000
  %scevgep158 = getelementptr i8, i8* %19, i64 %38
  %39 = add i64 16000, %38
  %scevgep159 = getelementptr i8, i8* %19, i64 %39
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv115, i64 %indvars.iv119
  br i1 false, label %._crit_edge153.preheader, label %min.iters.checked

._crit_edge153.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader69.us.us
  %indvars.iv111.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader69.us.us ], [ 2000, %middle.block ]
  br i1 true, label %._crit_edge153.prol.loopexit.unr-lcssa, label %._crit_edge153.prol.preheader

._crit_edge153.prol.preheader:                    ; preds = %._crit_edge153.preheader
  br label %._crit_edge153.prol

._crit_edge153.prol:                              ; preds = %._crit_edge153.prol.preheader
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111.ph, i64 %indvars.iv119
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv115, i64 %indvars.iv111.ph
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %45, align 8
  %indvars.iv.next112.prol = add nuw nsw i64 %indvars.iv111.ph, 1
  br label %._crit_edge153.prol.loopexit.unr-lcssa

._crit_edge153.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge153.preheader, %._crit_edge153.prol
  %indvars.iv111.unr.ph = phi i64 [ %indvars.iv.next112.prol, %._crit_edge153.prol ], [ %indvars.iv111.ph, %._crit_edge153.preheader ]
  br label %._crit_edge153.prol.loopexit

._crit_edge153.prol.loopexit:                     ; preds = %._crit_edge153.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge79.us.us.loopexit, label %._crit_edge153.preheader.new

._crit_edge153.preheader.new:                     ; preds = %._crit_edge153.prol.loopexit
  br label %._crit_edge153

min.iters.checked:                                ; preds = %.preheader69.us.us
  br i1 false, label %._crit_edge153.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep158, %scevgep162163
  %bound1 = icmp ult i8* %scevgep160161, %scevgep159
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %40 to i8*
  %bc164 = bitcast double* %40 to i8*
  %bound0165 = icmp ult i8* %scevgep158, %bc164
  %bound1166 = icmp ult i8* %bc, %scevgep159
  %found.conflict167 = and i1 %bound0165, %bound1166
  %conflict.rdx = or i1 %found.conflict, %found.conflict167
  br i1 %conflict.rdx, label %._crit_edge153.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %48 = load double, double* %40, align 8, !alias.scope !3
  %49 = insertelement <2 x double> undef, double %48, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  %51 = insertelement <2 x double> undef, double %48, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %53 = or i64 %index, 1
  %54 = or i64 %index, 2
  %55 = or i64 %index, 3
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv119
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %53, i64 %indvars.iv119
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %54, i64 %indvars.iv119
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %55, i64 %indvars.iv119
  %60 = load double, double* %56, align 8, !alias.scope !6
  %61 = load double, double* %57, align 8, !alias.scope !6
  %62 = load double, double* %58, align 8, !alias.scope !6
  %63 = load double, double* %59, align 8, !alias.scope !6
  %64 = insertelement <2 x double> undef, double %60, i32 0
  %65 = insertelement <2 x double> %64, double %61, i32 1
  %66 = insertelement <2 x double> undef, double %62, i32 0
  %67 = insertelement <2 x double> %66, double %63, i32 1
  %68 = fmul <2 x double> %50, %65
  %69 = fmul <2 x double> %52, %67
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv115, i64 %index
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !8, !noalias !10
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load169 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !8, !noalias !10
  %74 = fadd <2 x double> %wide.load, %68
  %75 = fadd <2 x double> %wide.load169, %69
  %76 = bitcast double* %70 to <2 x double>*
  store <2 x double> %74, <2 x double>* %76, align 8, !alias.scope !8, !noalias !10
  %77 = bitcast double* %72 to <2 x double>*
  store <2 x double> %75, <2 x double>* %77, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %78 = icmp eq i64 %index.next, 2000
  br i1 %78, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge79.us.us, label %._crit_edge153.preheader

._crit_edge79.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge153
  br label %._crit_edge79.us.us.loopexit

._crit_edge79.us.us.loopexit:                     ; preds = %._crit_edge153.prol.loopexit, %._crit_edge79.us.us.loopexit.unr-lcssa
  br label %._crit_edge79.us.us

._crit_edge79.us.us:                              ; preds = %._crit_edge79.us.us.loopexit, %middle.block
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond118, label %._crit_edge81.us, label %.preheader69.us.us

._crit_edge153:                                   ; preds = %._crit_edge153, %._crit_edge153.preheader.new
  %indvars.iv111 = phi i64 [ %indvars.iv111.unr.ph, %._crit_edge153.preheader.new ], [ %indvars.iv.next112.1, %._crit_edge153 ]
  %79 = load double, double* %40, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111, i64 %indvars.iv119
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv115, i64 %indvars.iv111
  %84 = load double, double* %83, align 8
  %85 = fadd double %84, %82
  store double %85, double* %83, align 8
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %86 = load double, double* %40, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next112, i64 %indvars.iv119
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv115, i64 %indvars.iv.next112
  %91 = load double, double* %90, align 8
  %92 = fadd double %91, %89
  store double %92, double* %90, align 8
  %indvars.iv.next112.1 = add nsw i64 %indvars.iv111, 2
  %exitcond114.1 = icmp eq i64 %indvars.iv.next112.1, 2000
  br i1 %exitcond114.1, label %._crit_edge79.us.us.loopexit.unr-lcssa, label %._crit_edge153, !llvm.loop !14

.preheader.us.preheader:                          ; preds = %._crit_edge81.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep179 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 0
  %scevgep179180 = bitcast double* %scevgep179 to i8*
  %scevgep181 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 2000
  %scevgep181182 = bitcast double* %scevgep181 to i8*
  %93 = mul nuw nsw i64 %indvars.iv107, 16000
  %scevgep183 = getelementptr i8, i8* %19, i64 %93
  %94 = add i64 16000, %93
  %scevgep184 = getelementptr i8, i8* %19, i64 %94
  br i1 false, label %._crit_edge154.preheader, label %min.iters.checked174

min.iters.checked174:                             ; preds = %.preheader.us
  br i1 false, label %._crit_edge154.preheader, label %vector.memcheck189

vector.memcheck189:                               ; preds = %min.iters.checked174
  %bound0185 = icmp ult i8* %scevgep179180, %scevgep184
  %bound1186 = icmp ult i8* %scevgep183, %scevgep181182
  %memcheck.conflict188 = and i1 %bound0185, %bound1186
  br i1 %memcheck.conflict188, label %._crit_edge154.preheader, label %vector.body170.preheader

vector.body170.preheader:                         ; preds = %vector.memcheck189
  br label %vector.body170

vector.body170:                                   ; preds = %vector.body170.preheader, %vector.body170
  %index191 = phi i64 [ %index.next192, %vector.body170 ], [ 0, %vector.body170.preheader ]
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv107, i64 %index191
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load199 = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !15
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load200 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !15
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %index191
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load199, <2 x i64>* %100, align 8, !alias.scope !18, !noalias !15
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load200, <2 x i64>* %102, align 8, !alias.scope !18, !noalias !15
  %index.next192 = add i64 %index191, 4
  %103 = icmp eq i64 %index.next192, 2000
  br i1 %103, label %middle.block171, label %vector.body170, !llvm.loop !20

middle.block171:                                  ; preds = %vector.body170
  br i1 true, label %._crit_edge.us, label %._crit_edge154.preheader

._crit_edge154.preheader:                         ; preds = %middle.block171, %vector.memcheck189, %min.iters.checked174, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck189 ], [ 0, %min.iters.checked174 ], [ 0, %.preheader.us ], [ 2000, %middle.block171 ]
  %104 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge154.prol.loopexit, label %._crit_edge154.prol.preheader

._crit_edge154.prol.preheader:                    ; preds = %._crit_edge154.preheader
  br label %._crit_edge154.prol

._crit_edge154.prol:                              ; preds = %._crit_edge154.prol, %._crit_edge154.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge154.prol ], [ %indvars.iv.ph, %._crit_edge154.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge154.prol ], [ 0, %._crit_edge154.prol.preheader ]
  %105 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv107, i64 %indvars.iv.prol
  %106 = bitcast double* %105 to i64*
  %107 = load i64, i64* %106, align 8
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv.prol
  %109 = bitcast double* %108 to i64*
  store i64 %107, i64* %109, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge154.prol.loopexit.unr-lcssa, label %._crit_edge154.prol, !llvm.loop !21

._crit_edge154.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge154.prol
  br label %._crit_edge154.prol.loopexit

._crit_edge154.prol.loopexit:                     ; preds = %._crit_edge154.preheader, %._crit_edge154.prol.loopexit.unr-lcssa
  %110 = icmp ult i64 %104, 3
  br i1 %110, label %._crit_edge.us.loopexit, label %._crit_edge154.preheader.new

._crit_edge154.preheader.new:                     ; preds = %._crit_edge154.prol.loopexit
  br label %._crit_edge154

._crit_edge154:                                   ; preds = %._crit_edge154, %._crit_edge154.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge154.preheader.new ], [ %indvars.iv.next.3, %._crit_edge154 ]
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv107, i64 %indvars.iv
  %112 = bitcast double* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv.next
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.1
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv.next.1
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.2
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv.next.2
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond106.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond106.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge154, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge154
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge154.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block171
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next108, 2000
  br i1 %exitcond110, label %._crit_edge76.loopexit, label %.preheader.us

._crit_edge76.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge76.loopexit, %._crit_edge102.thread
  %131 = phi i8* [ %3, %._crit_edge102.thread ], [ %19, %._crit_edge76.loopexit ]
  tail call void @free(i8* %131) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]*) unnamed_addr #0 {
  br i1 true, label %.preheader44.preheader, label %._crit_edge51

.preheader44.preheader:                           ; preds = %2
  br label %.preheader44

.preheader44:                                     ; preds = %.preheader44.preheader, %._crit_edge49
  %indvars.iv87 = phi i2 [ 0, %.preheader44.preheader ], [ %indvars.iv.next88, %._crit_edge49 ]
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge49 ], [ 0, %.preheader44.preheader ]
  %3 = zext i2 %indvars.iv87 to i64
  %4 = add nsw i64 %indvars.iv74, -1
  %5 = icmp sgt i64 %indvars.iv74, 0
  br i1 %5, label %.preheader.preheader, label %._crit_edge49

.preheader.preheader:                             ; preds = %.preheader44
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 0
  br label %.preheader

.lr.ph48:                                         ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv74
  %.pre81 = load double, double* %7, align 8
  %xtraiter82 = and i64 %indvars.iv74, 3
  %lcmp.mod83 = icmp eq i64 %xtraiter82, 0
  br i1 %lcmp.mod83, label %._crit_edge79.prol.loopexit, label %._crit_edge79.prol.preheader

._crit_edge79.prol.preheader:                     ; preds = %.lr.ph48
  br label %._crit_edge79.prol

._crit_edge79.prol:                               ; preds = %._crit_edge79.prol, %._crit_edge79.prol.preheader
  %8 = phi double [ %.pre81, %._crit_edge79.prol.preheader ], [ %12, %._crit_edge79.prol ]
  %indvars.iv66.prol = phi i64 [ 0, %._crit_edge79.prol.preheader ], [ %indvars.iv.next67.prol, %._crit_edge79.prol ]
  %prol.iter = phi i64 [ %xtraiter82, %._crit_edge79.prol.preheader ], [ %prol.iter.sub, %._crit_edge79.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv66.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next67.prol = add nuw nsw i64 %indvars.iv66.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge79.prol.loopexit.unr-lcssa, label %._crit_edge79.prol, !llvm.loop !23

._crit_edge79.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge79.prol
  br label %._crit_edge79.prol.loopexit

._crit_edge79.prol.loopexit:                      ; preds = %.lr.ph48, %._crit_edge79.prol.loopexit.unr-lcssa
  %.unr84 = phi double [ %.pre81, %.lr.ph48 ], [ %12, %._crit_edge79.prol.loopexit.unr-lcssa ]
  %indvars.iv66.unr = phi i64 [ 0, %.lr.ph48 ], [ %3, %._crit_edge79.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge49.loopexit, label %.lr.ph48.new

.lr.ph48.new:                                     ; preds = %._crit_edge79.prol.loopexit
  br label %._crit_edge79

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv58, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv58
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge78.preheader, label %._crit_edge

._crit_edge78.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv58, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge78.prol.loopexit.unr-lcssa, label %._crit_edge78.prol.preheader

._crit_edge78.prol.preheader:                     ; preds = %._crit_edge78.preheader
  br label %._crit_edge78.prol

._crit_edge78.prol:                               ; preds = %._crit_edge78.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge78.prol.loopexit.unr-lcssa

._crit_edge78.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge78.preheader, %._crit_edge78.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge78.prol ], [ undef, %._crit_edge78.preheader ]
  %.unr.ph = phi double [ %20, %._crit_edge78.prol ], [ %.pre, %._crit_edge78.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge78.prol ], [ 0, %._crit_edge78.preheader ]
  br label %._crit_edge78.prol.loopexit

._crit_edge78.prol.loopexit:                      ; preds = %._crit_edge78.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv58, 1
  br i1 %21, label %._crit_edge.loopexit, label %._crit_edge78.preheader.new

._crit_edge78.preheader.new:                      ; preds = %._crit_edge78.prol.loopexit
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78, %._crit_edge78.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge78.preheader.new ], [ %34, %._crit_edge78 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge78.preheader.new ], [ %indvars.iv.next.1, %._crit_edge78 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond57.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv58
  br i1 %exitcond57.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge78

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge78
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge78.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge78.prol.loopexit ], [ %34, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %35 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv58
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next59, %indvars.iv74
  br i1 %exitcond65, label %.lr.ph48, label %.preheader

._crit_edge79:                                    ; preds = %._crit_edge79, %.lr.ph48.new
  %39 = phi double [ %.unr84, %.lr.ph48.new ], [ %55, %._crit_edge79 ]
  %indvars.iv66 = phi i64 [ %indvars.iv66.unr, %.lr.ph48.new ], [ %indvars.iv.next67.3, %._crit_edge79 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv66
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv.next67
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv.next67.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next67.2 = add nsw i64 %indvars.iv66, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv.next67.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next67.3 = add nsw i64 %indvars.iv66, 4
  %exitcond73.3 = icmp eq i64 %indvars.iv.next67.3, %indvars.iv74
  br i1 %exitcond73.3, label %._crit_edge49.loopexit.unr-lcssa, label %._crit_edge79

._crit_edge49.loopexit.unr-lcssa:                 ; preds = %._crit_edge79
  br label %._crit_edge49.loopexit

._crit_edge49.loopexit:                           ; preds = %._crit_edge79.prol.loopexit, %._crit_edge49.loopexit.unr-lcssa
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %.preheader44
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv74, i64 %indvars.iv74
  %57 = load double, double* %56, align 8
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %56, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, 2000
  %indvars.iv.next88 = add i2 %indvars.iv87, 1
  br i1 %exitcond77, label %._crit_edge51.loopexit, label %.preheader44

._crit_edge51.loopexit:                           ; preds = %._crit_edge49
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader.preheader, label %._crit_edge14

.preheader.preheader:                             ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv23 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next24, %._crit_edge ]
  %indvars.iv21 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next22, %._crit_edge ]
  %7 = mul nsw i64 %indvars.iv23, 2000
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge27, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge27 ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge27

; <label>:12:                                     ; preds = %._crit_edge28
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge28, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv23, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next, %indvars.iv21
  br i1 %exitcond20, label %._crit_edge, label %._crit_edge28

._crit_edge:                                      ; preds = %._crit_edge27
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 2000
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  br i1 %exitcond26, label %._crit_edge14.loopexit, label %.lr.ph

._crit_edge14.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !2}

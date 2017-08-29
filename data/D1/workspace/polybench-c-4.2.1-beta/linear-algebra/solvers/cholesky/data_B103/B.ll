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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader64.lr.ph, label %._crit_edge92.thread

._crit_edge92.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge67

.preheader64.lr.ph:                               ; preds = %2
  br label %.lr.ph86

.lr.ph86:                                         ; preds = %._crit_edge90, %.preheader64.lr.ph
  %indvars.iv139 = phi i64 [ 0, %.preheader64.lr.ph ], [ %indvars.iv.next140, %._crit_edge90 ]
  %indvars.iv137 = phi i64 [ 1, %.preheader64.lr.ph ], [ %indvars.iv.next138, %._crit_edge90 ]
  %4 = sub i64 1998, %indvars.iv139
  br label %12

.preheader63:                                     ; preds = %12
  %5 = mul nuw nsw i64 %indvars.iv139, 2001
  %6 = shl i64 %4, 3
  %7 = add nuw nsw i64 %5, 1
  %8 = and i64 %6, 34359738360
  %scevgep133 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %7
  %9 = add nuw nsw i64 %8, 8
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %10 = icmp slt i64 %indvars.iv.next140, 2000
  br i1 %10, label %.lr.ph89.preheader, label %._crit_edge90

.lr.ph89.preheader:                               ; preds = %.preheader63
  %11 = bitcast double* %scevgep133 to i8*
  call void @llvm.memset.p0i8.i64(i8* %11, i8 0, i64 %9, i32 8, i1 false)
  br label %._crit_edge90

; <label>:12:                                     ; preds = %12, %.lr.ph86
  %indvars.iv121 = phi i64 [ 0, %.lr.ph86 ], [ %indvars.iv.next122, %12 ]
  %13 = sub nsw i64 0, %indvars.iv121
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 2000
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fadd double %17, 1.000000e+00
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv121
  store double %18, double* %19, align 8
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next122, %indvars.iv137
  br i1 %exitcond128, label %.preheader63, label %12

._crit_edge90:                                    ; preds = %.lr.ph89.preheader, %.preheader63
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv139
  store double 1.000000e+00, double* %20, align 8
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next140, 2000
  br i1 %exitcond142, label %._crit_edge92, label %.lr.ph86

._crit_edge92:                                    ; preds = %._crit_edge90
  %21 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %._crit_edge83.us.prol.loopexit, label %._crit_edge83.us.prol.preheader

._crit_edge83.us.prol.preheader:                  ; preds = %._crit_edge92
  br label %._crit_edge83.us.prol

._crit_edge83.us.prol:                            ; preds = %._crit_edge83.us.prol, %._crit_edge83.us.prol.preheader
  %indvars.iv117.prol = phi i64 [ 0, %._crit_edge83.us.prol.preheader ], [ %indvars.iv.next118.prol, %._crit_edge83.us.prol ]
  %prol.iter193 = phi i64 [ 0, %._crit_edge83.us.prol.preheader ], [ %prol.iter193.sub, %._crit_edge83.us.prol ]
  %22 = mul nuw nsw i64 %indvars.iv117.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %21, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.prol = add nuw nsw i64 %indvars.iv117.prol, 1
  %prol.iter193.sub = add nsw i64 %prol.iter193, -1
  %prol.iter193.cmp = icmp eq i64 %prol.iter193.sub, 0
  br i1 %prol.iter193.cmp, label %._crit_edge83.us.prol.loopexit.unr-lcssa, label %._crit_edge83.us.prol, !llvm.loop !1

._crit_edge83.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge83.us.prol
  br label %._crit_edge83.us.prol.loopexit

._crit_edge83.us.prol.loopexit:                   ; preds = %._crit_edge92, %._crit_edge83.us.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader59.us.us.preheader.preheader, label %._crit_edge92.new

._crit_edge92.new:                                ; preds = %._crit_edge83.us.prol.loopexit
  br label %._crit_edge83.us

._crit_edge83.us:                                 ; preds = %._crit_edge83.us, %._crit_edge92.new
  %indvars.iv117 = phi i64 [ 0, %._crit_edge92.new ], [ %indvars.iv.next118.7, %._crit_edge83.us ]
  %23 = mul nuw nsw i64 %indvars.iv117, 16000
  %scevgep = getelementptr i8, i8* %21, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %24 = mul i64 %indvars.iv117, 16000
  %25 = add i64 %24, 16000
  %scevgep.1 = getelementptr i8, i8* %21, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %26 = mul i64 %indvars.iv117, 16000
  %27 = add i64 %26, 32000
  %scevgep.2 = getelementptr i8, i8* %21, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %28 = mul i64 %indvars.iv117, 16000
  %29 = add i64 %28, 48000
  %scevgep.3 = getelementptr i8, i8* %21, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %30 = mul i64 %indvars.iv117, 16000
  %31 = add i64 %30, 64000
  %scevgep.4 = getelementptr i8, i8* %21, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %32 = mul i64 %indvars.iv117, 16000
  %33 = add i64 %32, 80000
  %scevgep.5 = getelementptr i8, i8* %21, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %34 = mul i64 %indvars.iv117, 16000
  %35 = add i64 %34, 96000
  %scevgep.6 = getelementptr i8, i8* %21, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %36 = mul i64 %indvars.iv117, 16000
  %37 = add i64 %36, 112000
  %scevgep.7 = getelementptr i8, i8* %21, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.7 = add nsw i64 %indvars.iv117, 8
  %exitcond120.7 = icmp eq i64 %indvars.iv.next118.7, 2000
  br i1 %exitcond120.7, label %.preheader59.us.us.preheader.preheader.unr-lcssa, label %._crit_edge83.us

.preheader59.us.us.preheader.preheader.unr-lcssa: ; preds = %._crit_edge83.us
  br label %.preheader59.us.us.preheader.preheader

.preheader59.us.us.preheader.preheader:           ; preds = %._crit_edge83.us.prol.loopexit, %.preheader59.us.us.preheader.preheader.unr-lcssa
  %38 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %39 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %40 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %41 = bitcast i8* %21 to [2000 x [2000 x double]]*
  br label %.preheader59.us.us.preheader

.preheader59.us.us.preheader:                     ; preds = %.preheader59.us.us.preheader.preheader, %._crit_edge72.us
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %._crit_edge72.us ], [ 0, %.preheader59.us.us.preheader.preheader ]
  %scevgep148 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv109
  %42 = add nsw i64 %indvars.iv109, -1999
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %42
  %43 = bitcast double* %scevgep150 to i8*
  %44 = bitcast double* %scevgep148 to i8*
  br label %.preheader59.us.us

._crit_edge72.us:                                 ; preds = %._crit_edge70.us.us
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next110, 2000
  br i1 %exitcond112, label %.preheader.us.preheader, label %.preheader59.us.us.preheader

.preheader59.us.us:                               ; preds = %._crit_edge70.us.us, %.preheader59.us.us.preheader
  %indvars.iv105 = phi i64 [ 0, %.preheader59.us.us.preheader ], [ %indvars.iv.next106, %._crit_edge70.us.us ]
  %45 = mul nuw nsw i64 %indvars.iv105, 16000
  %scevgep146 = getelementptr i8, i8* %21, i64 %45
  %46 = add i64 16000, %45
  %scevgep147 = getelementptr i8, i8* %21, i64 %46
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv109
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader59.us.us
  %indvars.iv101.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader59.us.us ], [ 2000, %middle.block ]
  br i1 true, label %scalar.ph.prol.loopexit.unr-lcssa, label %scalar.ph.prol.preheader

scalar.ph.prol.preheader:                         ; preds = %scalar.ph.preheader
  br label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.prol.preheader
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101.ph, i64 %indvars.iv109
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv105, i64 %indvars.iv101.ph
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %52, align 8
  %indvars.iv.next102.prol = add nuw nsw i64 %indvars.iv101.ph, 1
  br label %scalar.ph.prol.loopexit.unr-lcssa

scalar.ph.prol.loopexit.unr-lcssa:                ; preds = %scalar.ph.preheader, %scalar.ph.prol
  %indvars.iv101.unr.ph = phi i64 [ %indvars.iv.next102.prol, %scalar.ph.prol ], [ %indvars.iv101.ph, %scalar.ph.preheader ]
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge70.us.us.loopexit, label %scalar.ph.preheader.new

scalar.ph.preheader.new:                          ; preds = %scalar.ph.prol.loopexit
  br label %scalar.ph

min.iters.checked:                                ; preds = %.preheader59.us.us
  br i1 false, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep146, %43
  %bound1 = icmp ult i8* %44, %scevgep147
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %47 to i8*
  %bc152 = bitcast double* %47 to i8*
  %bound0153 = icmp ult i8* %scevgep146, %bc152
  %bound1154 = icmp ult i8* %bc, %scevgep147
  %found.conflict155 = and i1 %bound0153, %bound1154
  %conflict.rdx = or i1 %found.conflict, %found.conflict155
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %55 = load double, double* %47, align 8, !alias.scope !3
  %56 = insertelement <2 x double> undef, double %55, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = insertelement <2 x double> undef, double %55, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %60 = or i64 %index, 1
  %61 = or i64 %index, 2
  %62 = or i64 %index, 3
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv109
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %60, i64 %indvars.iv109
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %61, i64 %indvars.iv109
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %62, i64 %indvars.iv109
  %67 = load double, double* %63, align 8, !alias.scope !6
  %68 = load double, double* %64, align 8, !alias.scope !6
  %69 = load double, double* %65, align 8, !alias.scope !6
  %70 = load double, double* %66, align 8, !alias.scope !6
  %71 = insertelement <2 x double> undef, double %67, i32 0
  %72 = insertelement <2 x double> %71, double %68, i32 1
  %73 = insertelement <2 x double> undef, double %69, i32 0
  %74 = insertelement <2 x double> %73, double %70, i32 1
  %75 = fmul <2 x double> %57, %72
  %76 = fmul <2 x double> %59, %74
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv105, i64 %index
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !8, !noalias !10
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !8, !noalias !10
  %81 = fadd <2 x double> %wide.load, %75
  %82 = fadd <2 x double> %wide.load157, %76
  %83 = bitcast double* %77 to <2 x double>*
  store <2 x double> %81, <2 x double>* %83, align 8, !alias.scope !8, !noalias !10
  %84 = bitcast double* %79 to <2 x double>*
  store <2 x double> %82, <2 x double>* %84, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %85 = icmp eq i64 %index.next, 2000
  br i1 %85, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge70.us.us, label %scalar.ph.preheader

._crit_edge70.us.us.loopexit.unr-lcssa:           ; preds = %scalar.ph
  br label %._crit_edge70.us.us.loopexit

._crit_edge70.us.us.loopexit:                     ; preds = %scalar.ph.prol.loopexit, %._crit_edge70.us.us.loopexit.unr-lcssa
  br label %._crit_edge70.us.us

._crit_edge70.us.us:                              ; preds = %._crit_edge70.us.us.loopexit, %middle.block
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, 2000
  br i1 %exitcond108, label %._crit_edge72.us, label %.preheader59.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader.new
  %indvars.iv101 = phi i64 [ %indvars.iv101.unr.ph, %scalar.ph.preheader.new ], [ %indvars.iv.next102.1, %scalar.ph ]
  %86 = load double, double* %47, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101, i64 %indvars.iv109
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv105, i64 %indvars.iv101
  %91 = load double, double* %90, align 8
  %92 = fadd double %91, %89
  store double %92, double* %90, align 8
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %93 = load double, double* %47, align 8
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next102, i64 %indvars.iv109
  %95 = load double, double* %94, align 8
  %96 = fmul double %93, %95
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next102
  %98 = load double, double* %97, align 8
  %99 = fadd double %98, %96
  store double %99, double* %97, align 8
  %indvars.iv.next102.1 = add nsw i64 %indvars.iv101, 2
  %exitcond104.1 = icmp eq i64 %indvars.iv.next102.1, 2000
  br i1 %exitcond104.1, label %._crit_edge70.us.us.loopexit.unr-lcssa, label %scalar.ph, !llvm.loop !14

.preheader.us.preheader:                          ; preds = %._crit_edge72.us
  %100 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %101 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %105 = bitcast i8* %21 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep167 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 0
  %scevgep169 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 2000
  %106 = mul nuw nsw i64 %indvars.iv97, 16000
  %scevgep171 = getelementptr i8, i8* %21, i64 %106
  %107 = add i64 16000, %106
  %scevgep172 = getelementptr i8, i8* %21, i64 %107
  br i1 false, label %scalar.ph160.preheader, label %min.iters.checked162

min.iters.checked162:                             ; preds = %.preheader.us
  br i1 false, label %scalar.ph160.preheader, label %vector.memcheck177

vector.memcheck177:                               ; preds = %min.iters.checked162
  %108 = bitcast double* %scevgep169 to i8*
  %109 = bitcast double* %scevgep167 to i8*
  %bound0173 = icmp ult i8* %109, %scevgep172
  %bound1174 = icmp ult i8* %scevgep171, %108
  %memcheck.conflict176 = and i1 %bound0173, %bound1174
  br i1 %memcheck.conflict176, label %scalar.ph160.preheader, label %vector.body158.preheader

vector.body158.preheader:                         ; preds = %vector.memcheck177
  br label %vector.body158

vector.body158:                                   ; preds = %vector.body158.preheader, %vector.body158
  %index179 = phi i64 [ %index.next180, %vector.body158 ], [ 0, %vector.body158.preheader ]
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv97, i64 %index179
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load187 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !15
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x i64>*
  %wide.load188 = load <2 x i64>, <2 x i64>* %113, align 8, !alias.scope !15
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %index179
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load187, <2 x i64>* %115, align 8, !alias.scope !18, !noalias !15
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x i64>*
  store <2 x i64> %wide.load188, <2 x i64>* %117, align 8, !alias.scope !18, !noalias !15
  %index.next180 = add i64 %index179, 4
  %118 = icmp eq i64 %index.next180, 2000
  br i1 %118, label %middle.block159, label %vector.body158, !llvm.loop !20

middle.block159:                                  ; preds = %vector.body158
  br i1 true, label %._crit_edge.us, label %scalar.ph160.preheader

scalar.ph160.preheader:                           ; preds = %middle.block159, %vector.memcheck177, %min.iters.checked162, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck177 ], [ 0, %min.iters.checked162 ], [ 0, %.preheader.us ], [ 2000, %middle.block159 ]
  %119 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %scalar.ph160.prol.loopexit, label %scalar.ph160.prol.preheader

scalar.ph160.prol.preheader:                      ; preds = %scalar.ph160.preheader
  br label %scalar.ph160.prol

scalar.ph160.prol:                                ; preds = %scalar.ph160.prol, %scalar.ph160.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph160.prol ], [ %indvars.iv.ph, %scalar.ph160.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph160.prol ], [ 0, %scalar.ph160.prol.preheader ]
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv97, i64 %indvars.iv.prol
  %121 = bitcast double* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv.prol
  %124 = bitcast double* %123 to i64*
  store i64 %122, i64* %124, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph160.prol.loopexit.unr-lcssa, label %scalar.ph160.prol, !llvm.loop !21

scalar.ph160.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph160.prol
  br label %scalar.ph160.prol.loopexit

scalar.ph160.prol.loopexit:                       ; preds = %scalar.ph160.preheader, %scalar.ph160.prol.loopexit.unr-lcssa
  %125 = icmp ult i64 %119, 3
  br i1 %125, label %._crit_edge.us.loopexit, label %scalar.ph160.preheader.new

scalar.ph160.preheader.new:                       ; preds = %scalar.ph160.prol.loopexit
  br label %scalar.ph160

scalar.ph160:                                     ; preds = %scalar.ph160, %scalar.ph160.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %scalar.ph160.preheader.new ], [ %indvars.iv.next.3, %scalar.ph160 ]
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv97, i64 %indvars.iv
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next
  %132 = bitcast double* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv.next
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.1
  %137 = bitcast double* %136 to i64*
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv.next.1
  %140 = bitcast double* %139 to i64*
  store i64 %138, i64* %140, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %141 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.2
  %142 = bitcast double* %141 to i64*
  %143 = load i64, i64* %142, align 8
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv.next.2
  %145 = bitcast double* %144 to i64*
  store i64 %143, i64* %145, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond96.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond96.3, label %._crit_edge.us.loopexit.unr-lcssa, label %scalar.ph160, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %scalar.ph160
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %scalar.ph160.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block159
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond100, label %._crit_edge67.loopexit, label %.preheader.us

._crit_edge67.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge67

._crit_edge67:                                    ; preds = %._crit_edge67.loopexit, %._crit_edge92.thread
  %146 = phi i8* [ %3, %._crit_edge92.thread ], [ %21, %._crit_edge67.loopexit ]
  tail call void @free(i8* %146) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader36.preheader, label %._crit_edge45

.preheader36.preheader:                           ; preds = %2
  br label %.preheader36

.preheader36:                                     ; preds = %.preheader36.preheader, %._crit_edge42
  %indvars.iv81 = phi i2 [ 0, %.preheader36.preheader ], [ %indvars.iv.next82, %._crit_edge42 ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge42 ], [ 0, %.preheader36.preheader ]
  %3 = zext i2 %indvars.iv81 to i64
  %4 = add nsw i64 %indvars.iv68, -1
  %5 = icmp sgt i64 %indvars.iv68, 0
  br i1 %5, label %.preheader.preheader, label %._crit_edge42

.preheader.preheader:                             ; preds = %.preheader36
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 0
  br label %.preheader

.lr.ph41:                                         ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv68
  %.pre75 = load double, double* %7, align 8
  %xtraiter76 = and i64 %indvars.iv68, 3
  %lcmp.mod77 = icmp eq i64 %xtraiter76, 0
  br i1 %lcmp.mod77, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph41
  br label %8

; <label>:8:                                      ; preds = %8, %.prol.preheader
  %9 = phi double [ %.pre75, %.prol.preheader ], [ %13, %8 ]
  %indvars.iv60.prol = phi i64 [ 0, %.prol.preheader ], [ %indvars.iv.next61.prol, %8 ]
  %prol.iter = phi i64 [ %xtraiter76, %.prol.preheader ], [ %prol.iter.sub, %8 ]
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv60.prol
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %11
  %13 = fsub double %9, %12
  store double %13, double* %7, align 8
  %indvars.iv.next61.prol = add nuw nsw i64 %indvars.iv60.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %8, !llvm.loop !23

.prol.loopexit.unr-lcssa:                         ; preds = %8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph41, %.prol.loopexit.unr-lcssa
  %.unr78 = phi double [ %.pre75, %.lr.ph41 ], [ %13, %.prol.loopexit.unr-lcssa ]
  %indvars.iv60.unr = phi i64 [ 0, %.lr.ph41 ], [ %3, %.prol.loopexit.unr-lcssa ]
  %14 = icmp ult i64 %4, 3
  br i1 %14, label %._crit_edge42.loopexit, label %.lr.ph41.new

.lr.ph41.new:                                     ; preds = %.prol.loopexit
  br label %40

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge ], [ 0, %.preheader.preheader ]
  %15 = icmp sgt i64 %indvars.iv52, 0
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv52
  %.pre = load double, double* %16, align 8
  br i1 %15, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv52, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %17 = load double, double* %6, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 0
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %.pre, %20
  store double %21, double* %16, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.lcssa.unr.ph = phi double [ %21, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %21, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %22 = icmp eq i64 %indvars.iv52, 1
  br i1 %22, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %23 = phi double [ %.unr.ph, %.lr.ph.preheader.new ], [ %35, %.lr.ph ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv.next
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %29, %34
  store double %35, double* %16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv52
  br i1 %exitcond51.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %35, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %36 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv52
  %38 = load double, double* %37, align 8
  %39 = fdiv double %36, %38
  store double %39, double* %16, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next53, %indvars.iv68
  br i1 %exitcond59, label %.lr.ph41, label %.preheader

; <label>:40:                                     ; preds = %40, %.lr.ph41.new
  %41 = phi double [ %.unr78, %.lr.ph41.new ], [ %57, %40 ]
  %indvars.iv60 = phi i64 [ %indvars.iv60.unr, %.lr.ph41.new ], [ %indvars.iv.next61.3, %40 ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv60
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fsub double %41, %44
  store double %45, double* %7, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv.next61
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %7, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv.next61.1
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %7, align 8
  %indvars.iv.next61.2 = add nsw i64 %indvars.iv60, 3
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv.next61.2
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %55
  %57 = fsub double %53, %56
  store double %57, double* %7, align 8
  %indvars.iv.next61.3 = add nuw nsw i64 %indvars.iv60, 4
  %exitcond67.3 = icmp eq i64 %indvars.iv.next61.3, %indvars.iv68
  br i1 %exitcond67.3, label %._crit_edge42.loopexit.unr-lcssa, label %40

._crit_edge42.loopexit.unr-lcssa:                 ; preds = %40
  br label %._crit_edge42.loopexit

._crit_edge42.loopexit:                           ; preds = %.prol.loopexit, %._crit_edge42.loopexit.unr-lcssa
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader36
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv68
  %59 = load double, double* %58, align 8
  %60 = tail call double @sqrt(double %59) #3
  store double %60, double* %58, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, 2000
  %indvars.iv.next82 = add i2 %indvars.iv81, 1
  br i1 %exitcond71, label %._crit_edge45.loopexit, label %.preheader36

._crit_edge45.loopexit:                           ; preds = %._crit_edge42
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge45.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.preheader, label %._crit_edge13

.preheader.preheader:                             ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv22 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next23, %._crit_edge ]
  %indvars.iv20 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next21, %._crit_edge ]
  %7 = mul nsw i64 %indvars.iv22, 2000
  br label %8

; <label>:8:                                      ; preds = %15, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %15 ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %8, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, %indvars.iv20
  br i1 %exitcond19, label %._crit_edge, label %8

._crit_edge:                                      ; preds = %15
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 2000
  br i1 %exitcond25, label %._crit_edge13.loopexit, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

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

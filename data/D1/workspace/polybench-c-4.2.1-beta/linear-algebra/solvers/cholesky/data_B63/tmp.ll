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
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky([2000 x double]* %4)
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
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader62.lr.ph, label %._crit_edge90.thread

._crit_edge90.thread:                             ; preds = %1
  %2 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge65

.preheader62.lr.ph:                               ; preds = %1
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %._crit_edge88, %.preheader62.lr.ph
  %indvars.iv137 = phi i64 [ 0, %.preheader62.lr.ph ], [ %indvars.iv.next138, %._crit_edge88 ]
  %indvars.iv135 = phi i64 [ 1, %.preheader62.lr.ph ], [ %indvars.iv.next136, %._crit_edge88 ]
  %3 = mul nuw nsw i64 %indvars.iv137, 2001
  %4 = sub i64 1998, %indvars.iv137
  %5 = shl i64 %4, 3
  br label %._crit_edge

.preheader61:                                     ; preds = %._crit_edge
  %6 = add nuw nsw i64 %3, 1
  %7 = and i64 %5, 34359738360
  %scevgep131 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %6
  %8 = add nuw nsw i64 %7, 8
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %9 = icmp slt i64 %indvars.iv.next138, 2000
  br i1 %9, label %._crit_edge88.loopexit, label %._crit_edge88

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph84
  %indvars.iv119 = phi i64 [ 0, %.lr.ph84 ], [ %indvars.iv.next120, %._crit_edge ]
  %10 = sub nsw i64 0, %indvars.iv119
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv137, i64 %indvars.iv119
  store double %15, double* %16, align 8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next120, %indvars.iv135
  br i1 %exitcond126, label %.preheader61, label %._crit_edge

._crit_edge88.loopexit:                           ; preds = %.preheader61
  %17 = bitcast double* %scevgep131 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %17, i8 0, i64 %8, i32 8, i1 false)
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %.preheader61, %._crit_edge88.loopexit
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %18, align 8
  %exitcond140 = icmp eq i64 %indvars.iv.next138, 2000
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  br i1 %exitcond140, label %.preheader60.us.preheader, label %.lr.ph84

.preheader60.us.preheader:                        ; preds = %._crit_edge88
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %._crit_edge81.us.prol.loopexit, label %._crit_edge81.us.prol.preheader

._crit_edge81.us.prol.preheader:                  ; preds = %.preheader60.us.preheader
  br label %._crit_edge81.us.prol

._crit_edge81.us.prol:                            ; preds = %._crit_edge81.us.prol, %._crit_edge81.us.prol.preheader
  %indvars.iv115.prol = phi i64 [ 0, %._crit_edge81.us.prol.preheader ], [ %indvars.iv.next116.prol, %._crit_edge81.us.prol ]
  %prol.iter193 = phi i64 [ 0, %._crit_edge81.us.prol.preheader ], [ %prol.iter193.sub, %._crit_edge81.us.prol ]
  %20 = mul nuw nsw i64 %indvars.iv115.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %19, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.prol = add nuw nsw i64 %indvars.iv115.prol, 1
  %prol.iter193.sub = add nsw i64 %prol.iter193, -1
  %prol.iter193.cmp = icmp eq i64 %prol.iter193.sub, 0
  br i1 %prol.iter193.cmp, label %._crit_edge81.us.prol.loopexit.unr-lcssa, label %._crit_edge81.us.prol, !llvm.loop !1

._crit_edge81.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge81.us.prol
  br label %._crit_edge81.us.prol.loopexit

._crit_edge81.us.prol.loopexit:                   ; preds = %.preheader60.us.preheader, %._crit_edge81.us.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader57.us.us.preheader.preheader, label %.preheader60.us.preheader.new

.preheader60.us.preheader.new:                    ; preds = %._crit_edge81.us.prol.loopexit
  br label %._crit_edge81.us

._crit_edge81.us:                                 ; preds = %._crit_edge81.us, %.preheader60.us.preheader.new
  %indvars.iv115 = phi i64 [ 0, %.preheader60.us.preheader.new ], [ %indvars.iv.next116.7, %._crit_edge81.us ]
  %21 = mul nuw nsw i64 %indvars.iv115, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %22 = mul i64 %indvars.iv115, 16000
  %23 = add i64 %22, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %24 = mul i64 %indvars.iv115, 16000
  %25 = add i64 %24, 32000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %26 = mul i64 %indvars.iv115, 16000
  %27 = add i64 %26, 48000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %28 = mul i64 %indvars.iv115, 16000
  %29 = add i64 %28, 64000
  %scevgep.4 = getelementptr i8, i8* %19, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %30 = mul i64 %indvars.iv115, 16000
  %31 = add i64 %30, 80000
  %scevgep.5 = getelementptr i8, i8* %19, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %32 = mul i64 %indvars.iv115, 16000
  %33 = add i64 %32, 96000
  %scevgep.6 = getelementptr i8, i8* %19, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %34 = mul i64 %indvars.iv115, 16000
  %35 = add i64 %34, 112000
  %scevgep.7 = getelementptr i8, i8* %19, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.7 = add nsw i64 %indvars.iv115, 8
  %exitcond118.7 = icmp eq i64 %indvars.iv.next116.7, 2000
  br i1 %exitcond118.7, label %.preheader57.us.us.preheader.preheader.unr-lcssa, label %._crit_edge81.us

.preheader57.us.us.preheader.preheader.unr-lcssa: ; preds = %._crit_edge81.us
  br label %.preheader57.us.us.preheader.preheader

.preheader57.us.us.preheader.preheader:           ; preds = %._crit_edge81.us.prol.loopexit, %.preheader57.us.us.preheader.preheader.unr-lcssa
  %36 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %38 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %39 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader57.us.us.preheader

.preheader57.us.us.preheader:                     ; preds = %.preheader57.us.us.preheader.preheader, %._crit_edge70.us
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge70.us ], [ 0, %.preheader57.us.us.preheader.preheader ]
  %scevgep148 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv107
  %scevgep148149 = bitcast double* %scevgep148 to i8*
  %40 = add nsw i64 %indvars.iv107, -1999
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %0, i64 2000, i64 %40
  %scevgep150151 = bitcast double* %scevgep150 to i8*
  br label %.preheader57.us.us

._crit_edge70.us:                                 ; preds = %._crit_edge68.us.us
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next108, 2000
  br i1 %exitcond110, label %.preheader.us.preheader, label %.preheader57.us.us.preheader

.preheader57.us.us:                               ; preds = %._crit_edge68.us.us, %.preheader57.us.us.preheader
  %indvars.iv103 = phi i64 [ 0, %.preheader57.us.us.preheader ], [ %indvars.iv.next104, %._crit_edge68.us.us ]
  %41 = mul nuw nsw i64 %indvars.iv103, 16000
  %scevgep146 = getelementptr i8, i8* %19, i64 %41
  %42 = add i64 16000, %41
  %scevgep147 = getelementptr i8, i8* %19, i64 %42
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv107
  br i1 false, label %._crit_edge141.preheader, label %min.iters.checked

._crit_edge141.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader57.us.us
  %indvars.iv99.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader57.us.us ], [ 2000, %middle.block ]
  br i1 true, label %._crit_edge141.prol.loopexit.unr-lcssa, label %._crit_edge141.prol.preheader

._crit_edge141.prol.preheader:                    ; preds = %._crit_edge141.preheader
  br label %._crit_edge141.prol

._crit_edge141.prol:                              ; preds = %._crit_edge141.prol.preheader
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99.ph, i64 %indvars.iv107
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv103, i64 %indvars.iv99.ph
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  store double %50, double* %48, align 8
  %indvars.iv.next100.prol = add nuw nsw i64 %indvars.iv99.ph, 1
  br label %._crit_edge141.prol.loopexit.unr-lcssa

._crit_edge141.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge141.preheader, %._crit_edge141.prol
  %indvars.iv99.unr.ph = phi i64 [ %indvars.iv.next100.prol, %._crit_edge141.prol ], [ %indvars.iv99.ph, %._crit_edge141.preheader ]
  br label %._crit_edge141.prol.loopexit

._crit_edge141.prol.loopexit:                     ; preds = %._crit_edge141.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge68.us.us.loopexit, label %._crit_edge141.preheader.new

._crit_edge141.preheader.new:                     ; preds = %._crit_edge141.prol.loopexit
  br label %._crit_edge141

min.iters.checked:                                ; preds = %.preheader57.us.us
  br i1 false, label %._crit_edge141.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep146, %scevgep150151
  %bound1 = icmp ult i8* %scevgep148149, %scevgep147
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %43 to i8*
  %bc152 = bitcast double* %43 to i8*
  %bound0153 = icmp ult i8* %scevgep146, %bc152
  %bound1154 = icmp ult i8* %bc, %scevgep147
  %found.conflict155 = and i1 %bound0153, %bound1154
  %conflict.rdx = or i1 %found.conflict, %found.conflict155
  br i1 %conflict.rdx, label %._crit_edge141.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %51 = or i64 %index, 1
  %52 = or i64 %index, 2
  %53 = or i64 %index, 3
  %54 = load double, double* %43, align 8, !alias.scope !3
  %55 = insertelement <2 x double> undef, double %54, i32 0
  %56 = shufflevector <2 x double> %55, <2 x double> undef, <2 x i32> zeroinitializer
  %57 = insertelement <2 x double> undef, double %54, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv107
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %51, i64 %indvars.iv107
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %52, i64 %indvars.iv107
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %53, i64 %indvars.iv107
  %63 = load double, double* %59, align 8, !alias.scope !6
  %64 = load double, double* %60, align 8, !alias.scope !6
  %65 = load double, double* %61, align 8, !alias.scope !6
  %66 = load double, double* %62, align 8, !alias.scope !6
  %67 = insertelement <2 x double> undef, double %63, i32 0
  %68 = insertelement <2 x double> %67, double %64, i32 1
  %69 = insertelement <2 x double> undef, double %65, i32 0
  %70 = insertelement <2 x double> %69, double %66, i32 1
  %71 = fmul <2 x double> %56, %68
  %72 = fmul <2 x double> %58, %70
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv103, i64 %index
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !8, !noalias !10
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !8, !noalias !10
  %77 = fadd <2 x double> %wide.load, %71
  %78 = fadd <2 x double> %wide.load157, %72
  %79 = bitcast double* %73 to <2 x double>*
  store <2 x double> %77, <2 x double>* %79, align 8, !alias.scope !8, !noalias !10
  %80 = bitcast double* %75 to <2 x double>*
  store <2 x double> %78, <2 x double>* %80, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %81 = icmp eq i64 %index.next, 2000
  br i1 %81, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge68.us.us, label %._crit_edge141.preheader

._crit_edge68.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge141
  br label %._crit_edge68.us.us.loopexit

._crit_edge68.us.us.loopexit:                     ; preds = %._crit_edge141.prol.loopexit, %._crit_edge68.us.us.loopexit.unr-lcssa
  br label %._crit_edge68.us.us

._crit_edge68.us.us:                              ; preds = %._crit_edge68.us.us.loopexit, %middle.block
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, 2000
  br i1 %exitcond106, label %._crit_edge70.us, label %.preheader57.us.us

._crit_edge141:                                   ; preds = %._crit_edge141, %._crit_edge141.preheader.new
  %indvars.iv99 = phi i64 [ %indvars.iv99.unr.ph, %._crit_edge141.preheader.new ], [ %indvars.iv.next100.1, %._crit_edge141 ]
  %82 = load double, double* %43, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv107
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv103, i64 %indvars.iv99
  %87 = load double, double* %86, align 8
  %88 = fadd double %87, %85
  store double %88, double* %86, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %89 = load double, double* %43, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next100, i64 %indvars.iv107
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next100
  %94 = load double, double* %93, align 8
  %95 = fadd double %94, %92
  store double %95, double* %93, align 8
  %indvars.iv.next100.1 = add nsw i64 %indvars.iv99, 2
  %exitcond102.1 = icmp eq i64 %indvars.iv.next100.1, 2000
  br i1 %exitcond102.1, label %._crit_edge68.us.us.loopexit.unr-lcssa, label %._crit_edge141, !llvm.loop !14

.preheader.us.preheader:                          ; preds = %._crit_edge70.us
  %96 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %97 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %98 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %99 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %100 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %101 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep167 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 0
  %scevgep167168 = bitcast double* %scevgep167 to i8*
  %scevgep169 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 2000
  %scevgep169170 = bitcast double* %scevgep169 to i8*
  %102 = mul nuw nsw i64 %indvars.iv95, 16000
  %scevgep171 = getelementptr i8, i8* %19, i64 %102
  %103 = add i64 16000, %102
  %scevgep172 = getelementptr i8, i8* %19, i64 %103
  br i1 false, label %._crit_edge142.preheader, label %min.iters.checked162

min.iters.checked162:                             ; preds = %.preheader.us
  br i1 false, label %._crit_edge142.preheader, label %vector.memcheck177

vector.memcheck177:                               ; preds = %min.iters.checked162
  %bound0173 = icmp ult i8* %scevgep167168, %scevgep172
  %bound1174 = icmp ult i8* %scevgep171, %scevgep169170
  %memcheck.conflict176 = and i1 %bound0173, %bound1174
  br i1 %memcheck.conflict176, label %._crit_edge142.preheader, label %vector.body158.preheader

vector.body158.preheader:                         ; preds = %vector.memcheck177
  br label %vector.body158

vector.body158:                                   ; preds = %vector.body158.preheader, %vector.body158
  %index179 = phi i64 [ %index.next180, %vector.body158 ], [ 0, %vector.body158.preheader ]
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv95, i64 %index179
  %105 = bitcast double* %104 to <2 x i64>*
  %wide.load187 = load <2 x i64>, <2 x i64>* %105, align 8, !alias.scope !15
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x i64>*
  %wide.load188 = load <2 x i64>, <2 x i64>* %107, align 8, !alias.scope !15
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 %index179
  %109 = bitcast double* %108 to <2 x i64>*
  store <2 x i64> %wide.load187, <2 x i64>* %109, align 8, !alias.scope !18, !noalias !15
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x i64>*
  store <2 x i64> %wide.load188, <2 x i64>* %111, align 8, !alias.scope !18, !noalias !15
  %index.next180 = add i64 %index179, 4
  %112 = icmp eq i64 %index.next180, 2000
  br i1 %112, label %middle.block159, label %vector.body158, !llvm.loop !20

middle.block159:                                  ; preds = %vector.body158
  br i1 true, label %._crit_edge.us, label %._crit_edge142.preheader

._crit_edge142.preheader:                         ; preds = %middle.block159, %vector.memcheck177, %min.iters.checked162, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck177 ], [ 0, %min.iters.checked162 ], [ 0, %.preheader.us ], [ 2000, %middle.block159 ]
  %113 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge142.prol.loopexit, label %._crit_edge142.prol.preheader

._crit_edge142.prol.preheader:                    ; preds = %._crit_edge142.preheader
  br label %._crit_edge142.prol

._crit_edge142.prol:                              ; preds = %._crit_edge142.prol, %._crit_edge142.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge142.prol ], [ %indvars.iv.ph, %._crit_edge142.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge142.prol ], [ 0, %._crit_edge142.prol.preheader ]
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv95, i64 %indvars.iv.prol
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 %indvars.iv.prol
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge142.prol.loopexit.unr-lcssa, label %._crit_edge142.prol, !llvm.loop !21

._crit_edge142.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge142.prol
  br label %._crit_edge142.prol.loopexit

._crit_edge142.prol.loopexit:                     ; preds = %._crit_edge142.preheader, %._crit_edge142.prol.loopexit.unr-lcssa
  %119 = icmp ult i64 %113, 3
  br i1 %119, label %._crit_edge.us.loopexit, label %._crit_edge142.preheader.new

._crit_edge142.preheader.new:                     ; preds = %._crit_edge142.prol.loopexit
  br label %._crit_edge142

._crit_edge142:                                   ; preds = %._crit_edge142, %._crit_edge142.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge142.preheader.new ], [ %indvars.iv.next.3, %._crit_edge142 ]
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv95, i64 %indvars.iv
  %121 = bitcast double* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 %indvars.iv
  %124 = bitcast double* %123 to i64*
  store i64 %122, i64* %124, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %97, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 %indvars.iv.next
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %130 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %131 = bitcast double* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %134 = bitcast double* %133 to i64*
  store i64 %132, i64* %134, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %99, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %136 = bitcast double* %135 to i64*
  %137 = load i64, i64* %136, align 8
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond94.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond94.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge142, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge142
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge142.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block159
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next96, 2000
  br i1 %exitcond98, label %._crit_edge65.loopexit, label %.preheader.us

._crit_edge65.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.loopexit, %._crit_edge90.thread
  %140 = phi i8* [ %2, %._crit_edge90.thread ], [ %19, %._crit_edge65.loopexit ]
  tail call void @free(i8* %140) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader33.preheader, label %._crit_edge42

.preheader33.preheader:                           ; preds = %1
  br label %.preheader33

.preheader33:                                     ; preds = %.preheader33.preheader, %._crit_edge39
  %indvars.iv78 = phi i2 [ 0, %.preheader33.preheader ], [ %indvars.iv.next79, %._crit_edge39 ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge39 ], [ 0, %.preheader33.preheader ]
  %2 = zext i2 %indvars.iv78 to i64
  %3 = add nsw i64 %indvars.iv65, -1
  %4 = icmp sgt i64 %indvars.iv65, 0
  br i1 %4, label %.preheader.preheader, label %._crit_edge39

.preheader.preheader:                             ; preds = %.preheader33
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 0
  br label %.preheader

.lr.ph38:                                         ; preds = %._crit_edge
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv65
  %.pre72 = load double, double* %6, align 8
  %xtraiter73 = and i64 %indvars.iv65, 3
  %lcmp.mod74 = icmp eq i64 %xtraiter73, 0
  br i1 %lcmp.mod74, label %._crit_edge70.prol.loopexit, label %._crit_edge70.prol.preheader

._crit_edge70.prol.preheader:                     ; preds = %.lr.ph38
  br label %._crit_edge70.prol

._crit_edge70.prol:                               ; preds = %._crit_edge70.prol, %._crit_edge70.prol.preheader
  %7 = phi double [ %.pre72, %._crit_edge70.prol.preheader ], [ %11, %._crit_edge70.prol ]
  %indvars.iv57.prol = phi i64 [ 0, %._crit_edge70.prol.preheader ], [ %indvars.iv.next58.prol, %._crit_edge70.prol ]
  %prol.iter = phi i64 [ %xtraiter73, %._crit_edge70.prol.preheader ], [ %prol.iter.sub, %._crit_edge70.prol ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv57.prol
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fsub double %7, %10
  store double %11, double* %6, align 8
  %indvars.iv.next58.prol = add nuw nsw i64 %indvars.iv57.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge70.prol.loopexit.unr-lcssa, label %._crit_edge70.prol, !llvm.loop !23

._crit_edge70.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge70.prol
  br label %._crit_edge70.prol.loopexit

._crit_edge70.prol.loopexit:                      ; preds = %.lr.ph38, %._crit_edge70.prol.loopexit.unr-lcssa
  %.unr75 = phi double [ %.pre72, %.lr.ph38 ], [ %11, %._crit_edge70.prol.loopexit.unr-lcssa ]
  %indvars.iv57.unr = phi i64 [ 0, %.lr.ph38 ], [ %2, %._crit_edge70.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %3, 3
  br i1 %12, label %._crit_edge39.loopexit, label %.lr.ph38.new

.lr.ph38.new:                                     ; preds = %._crit_edge70.prol.loopexit
  br label %._crit_edge70

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge ], [ 0, %.preheader.preheader ]
  %13 = icmp sgt i64 %indvars.iv49, 0
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv49
  %.pre = load double, double* %14, align 8
  br i1 %13, label %._crit_edge69.preheader, label %._crit_edge

._crit_edge69.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv49, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge69.prol.loopexit.unr-lcssa, label %._crit_edge69.prol.preheader

._crit_edge69.prol.preheader:                     ; preds = %._crit_edge69.preheader
  br label %._crit_edge69.prol

._crit_edge69.prol:                               ; preds = %._crit_edge69.prol.preheader
  %15 = load double, double* %5, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 0
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %.pre, %18
  store double %19, double* %14, align 8
  br label %._crit_edge69.prol.loopexit.unr-lcssa

._crit_edge69.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge69.preheader, %._crit_edge69.prol
  %.lcssa.unr.ph = phi double [ %19, %._crit_edge69.prol ], [ undef, %._crit_edge69.preheader ]
  %.unr.ph = phi double [ %19, %._crit_edge69.prol ], [ %.pre, %._crit_edge69.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge69.prol ], [ 0, %._crit_edge69.preheader ]
  br label %._crit_edge69.prol.loopexit

._crit_edge69.prol.loopexit:                      ; preds = %._crit_edge69.prol.loopexit.unr-lcssa
  %20 = icmp eq i64 %indvars.iv49, 1
  br i1 %20, label %._crit_edge.loopexit, label %._crit_edge69.preheader.new

._crit_edge69.preheader.new:                      ; preds = %._crit_edge69.prol.loopexit
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge69, %._crit_edge69.preheader.new
  %21 = phi double [ %.unr.ph, %._crit_edge69.preheader.new ], [ %33, %._crit_edge69 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge69.preheader.new ], [ %indvars.iv.next.1, %._crit_edge69 ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  store double %33, double* %14, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv49
  br i1 %exitcond48.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge69

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge69
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge69.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge69.prol.loopexit ], [ %33, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %34 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv49
  %36 = load double, double* %35, align 8
  %37 = fdiv double %34, %36
  store double %37, double* %14, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next50, %indvars.iv65
  br i1 %exitcond56, label %.lr.ph38, label %.preheader

._crit_edge70:                                    ; preds = %._crit_edge70, %.lr.ph38.new
  %38 = phi double [ %.unr75, %.lr.ph38.new ], [ %54, %._crit_edge70 ]
  %indvars.iv57 = phi i64 [ %indvars.iv57.unr, %.lr.ph38.new ], [ %indvars.iv.next58.3, %._crit_edge70 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv57
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %40
  %42 = fsub double %38, %41
  store double %42, double* %6, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv.next58
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %44
  %46 = fsub double %42, %45
  store double %46, double* %6, align 8
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv.next58.1
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %48
  %50 = fsub double %46, %49
  store double %50, double* %6, align 8
  %indvars.iv.next58.2 = add nsw i64 %indvars.iv57, 3
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv.next58.2
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %52
  %54 = fsub double %50, %53
  store double %54, double* %6, align 8
  %indvars.iv.next58.3 = add nuw nsw i64 %indvars.iv57, 4
  %exitcond64.3 = icmp eq i64 %indvars.iv.next58.3, %indvars.iv65
  br i1 %exitcond64.3, label %._crit_edge39.loopexit.unr-lcssa, label %._crit_edge70

._crit_edge39.loopexit.unr-lcssa:                 ; preds = %._crit_edge70
  br label %._crit_edge39.loopexit

._crit_edge39.loopexit:                           ; preds = %._crit_edge70.prol.loopexit, %._crit_edge39.loopexit.unr-lcssa
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %.preheader33
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv65
  %56 = load double, double* %55, align 8
  %57 = tail call double @sqrt(double %56) #3
  store double %57, double* %55, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, 2000
  %indvars.iv.next79 = add i2 %indvars.iv78, 1
  br i1 %exitcond68, label %._crit_edge42.loopexit, label %.preheader33

._crit_edge42.loopexit:                           ; preds = %._crit_edge39
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %1
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.preheader, label %._crit_edge12

.preheader.preheader:                             ; preds = %1
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv21 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next22, %._crit_edge ]
  %indvars.iv19 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next20, %._crit_edge ]
  %6 = mul nsw i64 %indvars.iv21, 2000
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge25, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge25 ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge25

; <label>:11:                                     ; preds = %._crit_edge26
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge26, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next, %indvars.iv19
  br i1 %exitcond18, label %._crit_edge, label %._crit_edge26

._crit_edge:                                      ; preds = %._crit_edge25
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 2000
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  br i1 %exitcond24, label %._crit_edge12.loopexit, label %.lr.ph

._crit_edge12.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %1
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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

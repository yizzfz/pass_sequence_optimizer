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
  %.cast = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %.cast)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %.cast)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %4 = icmp sgt i32 %0, 42
  br i1 %4, label %5, label %._crit_edge

; <label>:5:                                      ; preds = %2
  %6 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %6, align 1
  %7 = icmp eq i8 %strcmpload, 0
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %5
  %9 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %2, %8
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader58.lr.ph, label %._crit_edge86.thread

._crit_edge86.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge61

.preheader58.lr.ph:                               ; preds = %2
  br label %.lr.ph80

.lr.ph80:                                         ; preds = %._crit_edge84, %.preheader58.lr.ph
  %indvars.iv133 = phi i64 [ 0, %.preheader58.lr.ph ], [ %indvars.iv.next134, %._crit_edge84 ]
  %indvars.iv131 = phi i64 [ 1, %.preheader58.lr.ph ], [ %indvars.iv.next132, %._crit_edge84 ]
  %4 = mul nuw nsw i64 %indvars.iv133, 2001
  %5 = add nuw nsw i64 %4, 1
  %6 = sub i64 1998, %indvars.iv133
  %7 = shl i64 %6, 3
  br label %._crit_edge

.preheader57:                                     ; preds = %._crit_edge
  %scevgep127 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  %8 = and i64 %7, 34359738360
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %9 = icmp slt i64 %indvars.iv.next134, 2000
  br i1 %9, label %._crit_edge84.loopexit, label %._crit_edge84

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph80
  %indvars.iv115 = phi i64 [ 0, %.lr.ph80 ], [ %indvars.iv.next116, %._crit_edge ]
  %10 = sub nsw i64 0, %indvars.iv115
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv133, i64 %indvars.iv115
  store double %15, double* %16, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next116, %indvars.iv131
  br i1 %exitcond122, label %.preheader57, label %._crit_edge

._crit_edge84.loopexit:                           ; preds = %.preheader57
  %17 = add nuw nsw i64 %8, 8
  %scevgep127128 = bitcast double* %scevgep127 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep127128, i8 0, i64 %17, i32 8, i1 false)
  br label %._crit_edge84

._crit_edge84:                                    ; preds = %.preheader57, %._crit_edge84.loopexit
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv133, i64 %indvars.iv133
  store double 1.000000e+00, double* %18, align 8
  %exitcond136 = icmp eq i64 %indvars.iv.next134, 2000
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  br i1 %exitcond136, label %._crit_edge86, label %.lr.ph80

._crit_edge86:                                    ; preds = %._crit_edge84
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %._crit_edge77.us.prol.loopexit, label %._crit_edge77.us.prol.preheader

._crit_edge77.us.prol.preheader:                  ; preds = %._crit_edge86
  br label %._crit_edge77.us.prol

._crit_edge77.us.prol:                            ; preds = %._crit_edge77.us.prol, %._crit_edge77.us.prol.preheader
  %indvars.iv111.prol = phi i64 [ 0, %._crit_edge77.us.prol.preheader ], [ %indvars.iv.next112.prol, %._crit_edge77.us.prol ]
  %prol.iter194 = phi i64 [ 0, %._crit_edge77.us.prol.preheader ], [ %prol.iter194.sub, %._crit_edge77.us.prol ]
  %20 = mul nuw nsw i64 %indvars.iv111.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %19, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next112.prol = add nuw nsw i64 %indvars.iv111.prol, 1
  %prol.iter194.sub = add nsw i64 %prol.iter194, -1
  %prol.iter194.cmp = icmp eq i64 %prol.iter194.sub, 0
  br i1 %prol.iter194.cmp, label %._crit_edge77.us.prol.loopexit.unr-lcssa, label %._crit_edge77.us.prol, !llvm.loop !1

._crit_edge77.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge77.us.prol
  br label %._crit_edge77.us.prol.loopexit

._crit_edge77.us.prol.loopexit:                   ; preds = %._crit_edge86, %._crit_edge77.us.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader53.us.us.preheader.preheader, label %._crit_edge86.new

._crit_edge86.new:                                ; preds = %._crit_edge77.us.prol.loopexit
  br label %._crit_edge77.us

._crit_edge77.us:                                 ; preds = %._crit_edge77.us, %._crit_edge86.new
  %indvars.iv111 = phi i64 [ 0, %._crit_edge86.new ], [ %indvars.iv.next112.7, %._crit_edge77.us ]
  %21 = mul nuw nsw i64 %indvars.iv111, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %22 = mul i64 %indvars.iv111, 16000
  %23 = add i64 %22, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %24 = mul i64 %indvars.iv111, 16000
  %25 = add i64 %24, 32000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %26 = mul i64 %indvars.iv111, 16000
  %27 = add i64 %26, 48000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %28 = mul i64 %indvars.iv111, 16000
  %29 = add i64 %28, 64000
  %scevgep.4 = getelementptr i8, i8* %19, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %30 = mul i64 %indvars.iv111, 16000
  %31 = add i64 %30, 80000
  %scevgep.5 = getelementptr i8, i8* %19, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %32 = mul i64 %indvars.iv111, 16000
  %33 = add i64 %32, 96000
  %scevgep.6 = getelementptr i8, i8* %19, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %34 = mul i64 %indvars.iv111, 16000
  %35 = add i64 %34, 112000
  %scevgep.7 = getelementptr i8, i8* %19, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next112.7 = add nsw i64 %indvars.iv111, 8
  %exitcond146.7 = icmp eq i64 %indvars.iv.next112.7, 2000
  br i1 %exitcond146.7, label %.preheader53.us.us.preheader.preheader.unr-lcssa, label %._crit_edge77.us

.preheader53.us.us.preheader.preheader.unr-lcssa: ; preds = %._crit_edge77.us
  br label %.preheader53.us.us.preheader.preheader

.preheader53.us.us.preheader.preheader:           ; preds = %._crit_edge77.us.prol.loopexit, %.preheader53.us.us.preheader.preheader.unr-lcssa
  %36 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %38 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %39 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader53.us.us.preheader

.preheader53.us.us.preheader:                     ; preds = %.preheader53.us.us.preheader.preheader, %._crit_edge66.us
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge66.us ], [ 0, %.preheader53.us.us.preheader.preheader ]
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv103
  %40 = add nsw i64 %indvars.iv103, -1999
  %scevgep151 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %40
  %41 = bitcast double* %scevgep151 to i8*
  %42 = bitcast double* %scevgep149 to i8*
  br label %.preheader53.us.us

._crit_edge66.us:                                 ; preds = %._crit_edge64.us.us
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond145 = icmp eq i64 %indvars.iv.next104, 2000
  br i1 %exitcond145, label %.preheader.us.preheader, label %.preheader53.us.us.preheader

.preheader53.us.us:                               ; preds = %._crit_edge64.us.us, %.preheader53.us.us.preheader
  %indvars.iv99 = phi i64 [ 0, %.preheader53.us.us.preheader ], [ %indvars.iv.next100, %._crit_edge64.us.us ]
  %43 = mul nuw nsw i64 %indvars.iv99, 16000
  %scevgep147 = getelementptr i8, i8* %19, i64 %43
  %44 = add i64 16000, %43
  %scevgep148 = getelementptr i8, i8* %19, i64 %44
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv103
  br i1 false, label %._crit_edge137.preheader, label %min.iters.checked

._crit_edge137.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader53.us.us
  %indvars.iv95.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader53.us.us ], [ 2000, %middle.block ]
  br i1 true, label %._crit_edge137.prol.loopexit.unr-lcssa, label %._crit_edge137.prol.preheader

._crit_edge137.prol.preheader:                    ; preds = %._crit_edge137.preheader
  br label %._crit_edge137.prol

._crit_edge137.prol:                              ; preds = %._crit_edge137.prol.preheader
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95.ph, i64 %indvars.iv103
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv99, i64 %indvars.iv95.ph
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next96.prol = add nuw nsw i64 %indvars.iv95.ph, 1
  br label %._crit_edge137.prol.loopexit.unr-lcssa

._crit_edge137.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge137.preheader, %._crit_edge137.prol
  %indvars.iv95.unr.ph = phi i64 [ %indvars.iv.next96.prol, %._crit_edge137.prol ], [ %indvars.iv95.ph, %._crit_edge137.preheader ]
  br label %._crit_edge137.prol.loopexit

._crit_edge137.prol.loopexit:                     ; preds = %._crit_edge137.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge64.us.us.loopexit, label %._crit_edge137.preheader.new

._crit_edge137.preheader.new:                     ; preds = %._crit_edge137.prol.loopexit
  br label %._crit_edge137

min.iters.checked:                                ; preds = %.preheader53.us.us
  br i1 false, label %._crit_edge137.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep147, %41
  %bound1 = icmp ult i8* %42, %scevgep148
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %45 to i8*
  %bc153 = bitcast double* %45 to i8*
  %bound0154 = icmp ult i8* %scevgep147, %bc153
  %bound1155 = icmp ult i8* %bc, %scevgep148
  %found.conflict156 = and i1 %bound0154, %bound1155
  %conflict.rdx = or i1 %found.conflict, %found.conflict156
  br i1 %conflict.rdx, label %._crit_edge137.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %53 = load double, double* %45, align 8, !alias.scope !3
  %54 = insertelement <2 x double> undef, double %53, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  %56 = insertelement <2 x double> undef, double %53, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %58 = or i64 %index, 1
  %59 = or i64 %index, 2
  %60 = or i64 %index, 3
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv103
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %58, i64 %indvars.iv103
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %59, i64 %indvars.iv103
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %60, i64 %indvars.iv103
  %65 = load double, double* %61, align 8, !alias.scope !6
  %66 = load double, double* %62, align 8, !alias.scope !6
  %67 = load double, double* %63, align 8, !alias.scope !6
  %68 = load double, double* %64, align 8, !alias.scope !6
  %69 = insertelement <2 x double> undef, double %65, i32 0
  %70 = insertelement <2 x double> %69, double %66, i32 1
  %71 = insertelement <2 x double> undef, double %67, i32 0
  %72 = insertelement <2 x double> %71, double %68, i32 1
  %73 = fmul <2 x double> %55, %70
  %74 = fmul <2 x double> %57, %72
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv99, i64 %index
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !8, !noalias !10
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !8, !noalias !10
  %79 = fadd <2 x double> %wide.load, %73
  %80 = fadd <2 x double> %wide.load158, %74
  %81 = bitcast double* %75 to <2 x double>*
  store <2 x double> %79, <2 x double>* %81, align 8, !alias.scope !8, !noalias !10
  %82 = bitcast double* %77 to <2 x double>*
  store <2 x double> %80, <2 x double>* %82, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %83 = icmp eq i64 %index.next, 2000
  br i1 %83, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge64.us.us, label %._crit_edge137.preheader

._crit_edge64.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge137
  br label %._crit_edge64.us.us.loopexit

._crit_edge64.us.us.loopexit:                     ; preds = %._crit_edge137.prol.loopexit, %._crit_edge64.us.us.loopexit.unr-lcssa
  br label %._crit_edge64.us.us

._crit_edge64.us.us:                              ; preds = %._crit_edge64.us.us.loopexit, %middle.block
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond144 = icmp eq i64 %indvars.iv.next100, 2000
  br i1 %exitcond144, label %._crit_edge66.us, label %.preheader53.us.us

._crit_edge137:                                   ; preds = %._crit_edge137, %._crit_edge137.preheader.new
  %indvars.iv95 = phi i64 [ %indvars.iv95.unr.ph, %._crit_edge137.preheader.new ], [ %indvars.iv.next96.1, %._crit_edge137 ]
  %84 = load double, double* %45, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv103
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv99, i64 %indvars.iv95
  %89 = load double, double* %88, align 8
  %90 = fadd double %89, %87
  store double %90, double* %88, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %91 = load double, double* %45, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next96, i64 %indvars.iv103
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv99, i64 %indvars.iv.next96
  %96 = load double, double* %95, align 8
  %97 = fadd double %96, %94
  store double %97, double* %95, align 8
  %indvars.iv.next96.1 = add nsw i64 %indvars.iv95, 2
  %exitcond143.1 = icmp eq i64 %indvars.iv.next96.1, 2000
  br i1 %exitcond143.1, label %._crit_edge64.us.us.loopexit.unr-lcssa, label %._crit_edge137, !llvm.loop !14

.preheader.us.preheader:                          ; preds = %._crit_edge66.us
  %98 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %99 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %100 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %101 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep168 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 0
  %scevgep170 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 2000
  %104 = mul nuw nsw i64 %indvars.iv91, 16000
  %scevgep172 = getelementptr i8, i8* %19, i64 %104
  %105 = add i64 16000, %104
  %scevgep173 = getelementptr i8, i8* %19, i64 %105
  br i1 false, label %._crit_edge138.preheader, label %min.iters.checked163

min.iters.checked163:                             ; preds = %.preheader.us
  br i1 false, label %._crit_edge138.preheader, label %vector.memcheck178

vector.memcheck178:                               ; preds = %min.iters.checked163
  %106 = bitcast double* %scevgep170 to i8*
  %107 = bitcast double* %scevgep168 to i8*
  %bound0174 = icmp ult i8* %107, %scevgep173
  %bound1175 = icmp ult i8* %scevgep172, %106
  %memcheck.conflict177 = and i1 %bound0174, %bound1175
  br i1 %memcheck.conflict177, label %._crit_edge138.preheader, label %vector.body159.preheader

vector.body159.preheader:                         ; preds = %vector.memcheck178
  br label %vector.body159

vector.body159:                                   ; preds = %vector.body159.preheader, %vector.body159
  %index180 = phi i64 [ %index.next181, %vector.body159 ], [ 0, %vector.body159.preheader ]
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv91, i64 %index180
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load188 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !15
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load189 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !15
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %index180
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load188, <2 x i64>* %113, align 8, !alias.scope !18, !noalias !15
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load189, <2 x i64>* %115, align 8, !alias.scope !18, !noalias !15
  %index.next181 = add i64 %index180, 4
  %116 = icmp eq i64 %index.next181, 2000
  br i1 %116, label %middle.block160, label %vector.body159, !llvm.loop !20

middle.block160:                                  ; preds = %vector.body159
  br i1 true, label %._crit_edge.us, label %._crit_edge138.preheader

._crit_edge138.preheader:                         ; preds = %middle.block160, %vector.memcheck178, %min.iters.checked163, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck178 ], [ 0, %min.iters.checked163 ], [ 0, %.preheader.us ], [ 2000, %middle.block160 ]
  %117 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge138.prol.loopexit, label %._crit_edge138.prol.preheader

._crit_edge138.prol.preheader:                    ; preds = %._crit_edge138.preheader
  br label %._crit_edge138.prol

._crit_edge138.prol:                              ; preds = %._crit_edge138.prol, %._crit_edge138.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge138.prol ], [ %indvars.iv.ph, %._crit_edge138.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge138.prol ], [ 0, %._crit_edge138.prol.preheader ]
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv91, i64 %indvars.iv.prol
  %119 = bitcast double* %118 to i64*
  %120 = load i64, i64* %119, align 8
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv.prol
  %122 = bitcast double* %121 to i64*
  store i64 %120, i64* %122, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge138.prol.loopexit.unr-lcssa, label %._crit_edge138.prol, !llvm.loop !21

._crit_edge138.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge138.prol
  br label %._crit_edge138.prol.loopexit

._crit_edge138.prol.loopexit:                     ; preds = %._crit_edge138.preheader, %._crit_edge138.prol.loopexit.unr-lcssa
  %123 = icmp ult i64 %117, 3
  br i1 %123, label %._crit_edge.us.loopexit, label %._crit_edge138.preheader.new

._crit_edge138.preheader.new:                     ; preds = %._crit_edge138.prol.loopexit
  br label %._crit_edge138

._crit_edge138:                                   ; preds = %._crit_edge138, %._crit_edge138.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge138.preheader.new ], [ %indvars.iv.next.3, %._crit_edge138 ]
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %99, i64 0, i64 %indvars.iv91, i64 %indvars.iv
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv.next
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %134 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %135 = bitcast double* %134 to i64*
  %136 = load i64, i64* %135, align 8
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %138 = bitcast double* %137 to i64*
  store i64 %136, i64* %138, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %139 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %140 = bitcast double* %139 to i64*
  %141 = load i64, i64* %140, align 8
  %142 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %143 = bitcast double* %142 to i64*
  store i64 %141, i64* %143, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge138, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge138
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge138.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block160
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next92, 2000
  br i1 %exitcond142, label %._crit_edge61.loopexit, label %.preheader.us

._crit_edge61.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge61.loopexit, %._crit_edge86.thread
  %144 = phi i8* [ %3, %._crit_edge86.thread ], [ %19, %._crit_edge61.loopexit ]
  tail call void @free(i8* %144) #3
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
  br i1 %lcmp.mod77, label %._crit_edge73.prol.loopexit, label %._crit_edge73.prol.preheader

._crit_edge73.prol.preheader:                     ; preds = %.lr.ph41
  br label %._crit_edge73.prol

._crit_edge73.prol:                               ; preds = %._crit_edge73.prol, %._crit_edge73.prol.preheader
  %8 = phi double [ %.pre75, %._crit_edge73.prol.preheader ], [ %12, %._crit_edge73.prol ]
  %indvars.iv60.prol = phi i64 [ 0, %._crit_edge73.prol.preheader ], [ %indvars.iv.next61.prol, %._crit_edge73.prol ]
  %prol.iter = phi i64 [ %xtraiter76, %._crit_edge73.prol.preheader ], [ %prol.iter.sub, %._crit_edge73.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv60.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next61.prol = add nuw nsw i64 %indvars.iv60.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge73.prol.loopexit.unr-lcssa, label %._crit_edge73.prol, !llvm.loop !23

._crit_edge73.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge73.prol
  br label %._crit_edge73.prol.loopexit

._crit_edge73.prol.loopexit:                      ; preds = %.lr.ph41, %._crit_edge73.prol.loopexit.unr-lcssa
  %.unr78 = phi double [ %.pre75, %.lr.ph41 ], [ %12, %._crit_edge73.prol.loopexit.unr-lcssa ]
  %indvars.iv60.unr = phi i64 [ 0, %.lr.ph41 ], [ %3, %._crit_edge73.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge42.loopexit, label %.lr.ph41.new

.lr.ph41.new:                                     ; preds = %._crit_edge73.prol.loopexit
  br label %._crit_edge73

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv52, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv52
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge72.preheader, label %._crit_edge

._crit_edge72.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv52, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge72.prol.loopexit.unr-lcssa, label %._crit_edge72.prol.preheader

._crit_edge72.prol.preheader:                     ; preds = %._crit_edge72.preheader
  br label %._crit_edge72.prol

._crit_edge72.prol:                               ; preds = %._crit_edge72.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge72.prol.loopexit.unr-lcssa

._crit_edge72.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge72.preheader, %._crit_edge72.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge72.prol ], [ undef, %._crit_edge72.preheader ]
  %.unr.ph = phi double [ %20, %._crit_edge72.prol ], [ %.pre, %._crit_edge72.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge72.prol ], [ 0, %._crit_edge72.preheader ]
  br label %._crit_edge72.prol.loopexit

._crit_edge72.prol.loopexit:                      ; preds = %._crit_edge72.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv52, 1
  br i1 %21, label %._crit_edge.loopexit, label %._crit_edge72.preheader.new

._crit_edge72.preheader.new:                      ; preds = %._crit_edge72.prol.loopexit
  br label %._crit_edge72

._crit_edge72:                                    ; preds = %._crit_edge72, %._crit_edge72.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge72.preheader.new ], [ %34, %._crit_edge72 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge72.preheader.new ], [ %indvars.iv.next.1, %._crit_edge72 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv52
  br i1 %exitcond51.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge72

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge72
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge72.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge72.prol.loopexit ], [ %34, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %35 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv52
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next53, %indvars.iv68
  br i1 %exitcond59, label %.lr.ph41, label %.preheader

._crit_edge73:                                    ; preds = %._crit_edge73, %.lr.ph41.new
  %39 = phi double [ %.unr78, %.lr.ph41.new ], [ %55, %._crit_edge73 ]
  %indvars.iv60 = phi i64 [ %indvars.iv60.unr, %.lr.ph41.new ], [ %indvars.iv.next61.3, %._crit_edge73 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv60
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv.next61
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv.next61.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next61.2 = add nsw i64 %indvars.iv60, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv.next61.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next61.3 = add nuw nsw i64 %indvars.iv60, 4
  %exitcond67.3 = icmp eq i64 %indvars.iv.next61.3, %indvars.iv68
  br i1 %exitcond67.3, label %._crit_edge42.loopexit.unr-lcssa, label %._crit_edge73

._crit_edge42.loopexit.unr-lcssa:                 ; preds = %._crit_edge73
  br label %._crit_edge42.loopexit

._crit_edge42.loopexit:                           ; preds = %._crit_edge73.prol.loopexit, %._crit_edge42.loopexit.unr-lcssa
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader36
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv68
  %57 = load double, double* %56, align 8
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %56, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond = icmp eq i64 %indvars.iv.next69, 2000
  %indvars.iv.next82 = add i2 %indvars.iv81, 1
  br i1 %exitcond, label %._crit_edge45.loopexit, label %.preheader36

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
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader.preheader, label %._crit_edge12

.preheader.preheader:                             ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv21 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next22, %._crit_edge ]
  %indvars.iv19 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next20, %._crit_edge ]
  %7 = mul nsw i64 %indvars.iv21, 2000
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge25, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge25 ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge25

; <label>:12:                                     ; preds = %._crit_edge26
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge26, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv21, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
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

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %2
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

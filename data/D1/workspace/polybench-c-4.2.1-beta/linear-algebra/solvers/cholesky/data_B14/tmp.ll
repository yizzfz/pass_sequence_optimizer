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

._crit_edge:                                      ; preds = %2
  br label %10

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge9

._crit_edge9:                                     ; preds = %6
  br label %10

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %10

; <label>:10:                                     ; preds = %._crit_edge9, %._crit_edge, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  br i1 true, label %.preheader71.lr.ph, label %._crit_edge100.thread

._crit_edge100.thread:                            ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge74

.preheader71.lr.ph:                               ; preds = %2
  br label %.lr.ph93

.lr.ph93:                                         ; preds = %._crit_edge98..lr.ph93_crit_edge, %.preheader71.lr.ph
  %indvars.iv147 = phi i64 [ 0, %.preheader71.lr.ph ], [ %indvars.iv.next148, %._crit_edge98..lr.ph93_crit_edge ]
  %indvars.iv145 = phi i64 [ 1, %.preheader71.lr.ph ], [ %indvars.iv.next146, %._crit_edge98..lr.ph93_crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv147, 2001
  %5 = sub i64 1998, %indvars.iv147
  %6 = shl i64 %5, 3
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.lr.ph93
  %indvars.iv129 = phi i64 [ 0, %.lr.ph93 ], [ %indvars.iv.next130, %._crit_edge ]
  %8 = sub nsw i64 0, %indvars.iv129
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv129
  store double %13, double* %14, align 8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next130, %indvars.iv145
  br i1 %exitcond136, label %._crit_edge94, label %._crit_edge

._crit_edge:                                      ; preds = %7
  br label %7

._crit_edge94:                                    ; preds = %7
  %15 = add nuw nsw i64 %4, 1
  %16 = and i64 %6, 34359738360
  %scevgep141 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %15
  %17 = add nuw nsw i64 %16, 8
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  %18 = icmp slt i64 %indvars.iv.next148, 2000
  br i1 %18, label %.lr.ph97.preheader, label %._crit_edge94.._crit_edge98_crit_edge

._crit_edge94.._crit_edge98_crit_edge:            ; preds = %._crit_edge94
  br label %._crit_edge98

.lr.ph97.preheader:                               ; preds = %._crit_edge94
  %19 = bitcast double* %scevgep141 to i8*
  call void @llvm.memset.p0i8.i64(i8* %19, i8 0, i64 %17, i32 8, i1 false)
  br label %._crit_edge98

._crit_edge98:                                    ; preds = %._crit_edge94.._crit_edge98_crit_edge, %.lr.ph97.preheader
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv147
  store double 1.000000e+00, double* %20, align 8
  %exitcond150 = icmp eq i64 %indvars.iv.next148, 2000
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  br i1 %exitcond150, label %._crit_edge100, label %._crit_edge98..lr.ph93_crit_edge

._crit_edge98..lr.ph93_crit_edge:                 ; preds = %._crit_edge98
  br label %.lr.ph93

._crit_edge100:                                   ; preds = %._crit_edge98
  %21 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %._crit_edge100.._crit_edge90.us.prol.loopexit_crit_edge, label %._crit_edge90.us.prol.preheader

._crit_edge100.._crit_edge90.us.prol.loopexit_crit_edge: ; preds = %._crit_edge100
  br label %._crit_edge90.us.prol.loopexit

._crit_edge90.us.prol.preheader:                  ; preds = %._crit_edge100
  br label %._crit_edge90.us.prol

._crit_edge90.us.prol:                            ; preds = %._crit_edge90.us.prol.._crit_edge90.us.prol_crit_edge, %._crit_edge90.us.prol.preheader
  %indvars.iv125.prol = phi i64 [ 0, %._crit_edge90.us.prol.preheader ], [ %indvars.iv.next126.prol, %._crit_edge90.us.prol.._crit_edge90.us.prol_crit_edge ]
  %prol.iter201 = phi i64 [ 0, %._crit_edge90.us.prol.preheader ], [ %prol.iter201.sub, %._crit_edge90.us.prol.._crit_edge90.us.prol_crit_edge ]
  %22 = mul nuw nsw i64 %indvars.iv125.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %21, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.prol = add nuw nsw i64 %indvars.iv125.prol, 1
  %prol.iter201.sub = add nsw i64 %prol.iter201, -1
  %prol.iter201.cmp = icmp eq i64 %prol.iter201.sub, 0
  br i1 %prol.iter201.cmp, label %._crit_edge90.us.prol.loopexit.unr-lcssa, label %._crit_edge90.us.prol.._crit_edge90.us.prol_crit_edge, !llvm.loop !1

._crit_edge90.us.prol.._crit_edge90.us.prol_crit_edge: ; preds = %._crit_edge90.us.prol
  br label %._crit_edge90.us.prol

._crit_edge90.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge90.us.prol
  br label %._crit_edge90.us.prol.loopexit

._crit_edge90.us.prol.loopexit:                   ; preds = %._crit_edge100.._crit_edge90.us.prol.loopexit_crit_edge, %._crit_edge90.us.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge90.us.prol.loopexit..preheader67.us.us.preheader.preheader_crit_edge, label %._crit_edge100.new

._crit_edge90.us.prol.loopexit..preheader67.us.us.preheader.preheader_crit_edge: ; preds = %._crit_edge90.us.prol.loopexit
  br label %.preheader67.us.us.preheader.preheader

._crit_edge100.new:                               ; preds = %._crit_edge90.us.prol.loopexit
  br label %._crit_edge90.us

._crit_edge90.us:                                 ; preds = %._crit_edge90.us.._crit_edge90.us_crit_edge, %._crit_edge100.new
  %indvars.iv125 = phi i64 [ 0, %._crit_edge100.new ], [ %indvars.iv.next126.7, %._crit_edge90.us.._crit_edge90.us_crit_edge ]
  %23 = mul nuw nsw i64 %indvars.iv125, 16000
  %scevgep = getelementptr i8, i8* %21, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %24 = mul i64 %indvars.iv125, 16000
  %25 = add i64 %24, 16000
  %scevgep.1 = getelementptr i8, i8* %21, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %26 = mul i64 %indvars.iv125, 16000
  %27 = add i64 %26, 32000
  %scevgep.2 = getelementptr i8, i8* %21, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %28 = mul i64 %indvars.iv125, 16000
  %29 = add i64 %28, 48000
  %scevgep.3 = getelementptr i8, i8* %21, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %30 = mul i64 %indvars.iv125, 16000
  %31 = add i64 %30, 64000
  %scevgep.4 = getelementptr i8, i8* %21, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %32 = mul i64 %indvars.iv125, 16000
  %33 = add i64 %32, 80000
  %scevgep.5 = getelementptr i8, i8* %21, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %34 = mul i64 %indvars.iv125, 16000
  %35 = add i64 %34, 96000
  %scevgep.6 = getelementptr i8, i8* %21, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %36 = mul i64 %indvars.iv125, 16000
  %37 = add i64 %36, 112000
  %scevgep.7 = getelementptr i8, i8* %21, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.7 = add nsw i64 %indvars.iv125, 8
  %exitcond128.7 = icmp eq i64 %indvars.iv.next126.7, 2000
  br i1 %exitcond128.7, label %.preheader67.us.us.preheader.preheader.unr-lcssa, label %._crit_edge90.us.._crit_edge90.us_crit_edge

._crit_edge90.us.._crit_edge90.us_crit_edge:      ; preds = %._crit_edge90.us
  br label %._crit_edge90.us

.preheader67.us.us.preheader.preheader.unr-lcssa: ; preds = %._crit_edge90.us
  br label %.preheader67.us.us.preheader.preheader

.preheader67.us.us.preheader.preheader:           ; preds = %._crit_edge90.us.prol.loopexit..preheader67.us.us.preheader.preheader_crit_edge, %.preheader67.us.us.preheader.preheader.unr-lcssa
  %38 = bitcast i8* %21 to [2000 x [2000 x double]]*
  br label %.preheader67.us.us.preheader

.preheader67.us.us.preheader:                     ; preds = %._crit_edge79.us..preheader67.us.us.preheader_crit_edge, %.preheader67.us.us.preheader.preheader
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %._crit_edge79.us..preheader67.us.us.preheader_crit_edge ], [ 0, %.preheader67.us.us.preheader.preheader ]
  %scevgep156 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv117
  %scevgep156157 = bitcast double* %scevgep156 to i8*
  %39 = add nsw i64 %indvars.iv117, -1999
  %scevgep158 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %39
  %scevgep158159 = bitcast double* %scevgep158 to i8*
  br label %.preheader67.us.us

._crit_edge79.us:                                 ; preds = %._crit_edge77.us.us
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next118, 2000
  br i1 %exitcond120, label %.preheader.us.preheader, label %._crit_edge79.us..preheader67.us.us.preheader_crit_edge

._crit_edge79.us..preheader67.us.us.preheader_crit_edge: ; preds = %._crit_edge79.us
  br label %.preheader67.us.us.preheader

.preheader67.us.us:                               ; preds = %._crit_edge77.us.us..preheader67.us.us_crit_edge, %.preheader67.us.us.preheader
  %indvars.iv113 = phi i64 [ 0, %.preheader67.us.us.preheader ], [ %indvars.iv.next114, %._crit_edge77.us.us..preheader67.us.us_crit_edge ]
  %40 = mul nuw nsw i64 %indvars.iv113, 16000
  %scevgep154 = getelementptr i8, i8* %21, i64 %40
  %41 = add i64 16000, %40
  %scevgep155 = getelementptr i8, i8* %21, i64 %41
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv113, i64 %indvars.iv117
  br i1 false, label %.preheader67.us.us.scalar.ph.preheader_crit_edge, label %min.iters.checked

.preheader67.us.us.scalar.ph.preheader_crit_edge: ; preds = %.preheader67.us.us
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block.scalar.ph.preheader_crit_edge, %vector.memcheck.scalar.ph.preheader_crit_edge, %min.iters.checked.scalar.ph.preheader_crit_edge, %.preheader67.us.us.scalar.ph.preheader_crit_edge
  %indvars.iv109.ph = phi i64 [ 0, %vector.memcheck.scalar.ph.preheader_crit_edge ], [ 0, %min.iters.checked.scalar.ph.preheader_crit_edge ], [ 0, %.preheader67.us.us.scalar.ph.preheader_crit_edge ], [ 2000, %middle.block.scalar.ph.preheader_crit_edge ]
  br i1 true, label %scalar.ph.preheader.scalar.ph.prol.loopexit.unr-lcssa_crit_edge, label %scalar.ph.prol.preheader

scalar.ph.preheader.scalar.ph.prol.loopexit.unr-lcssa_crit_edge: ; preds = %scalar.ph.preheader
  br label %scalar.ph.prol.loopexit.unr-lcssa

scalar.ph.prol.preheader:                         ; preds = %scalar.ph.preheader
  br label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.prol.preheader
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109.ph, i64 %indvars.iv117
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv113, i64 %indvars.iv109.ph
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  store double %49, double* %47, align 8
  %indvars.iv.next110.prol = add nuw nsw i64 %indvars.iv109.ph, 1
  br label %scalar.ph.prol.loopexit.unr-lcssa

scalar.ph.prol.loopexit.unr-lcssa:                ; preds = %scalar.ph.preheader.scalar.ph.prol.loopexit.unr-lcssa_crit_edge, %scalar.ph.prol
  %indvars.iv109.unr.ph = phi i64 [ %indvars.iv.next110.prol, %scalar.ph.prol ], [ %indvars.iv109.ph, %scalar.ph.preheader.scalar.ph.prol.loopexit.unr-lcssa_crit_edge ]
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol.loopexit.unr-lcssa
  br i1 false, label %scalar.ph.prol.loopexit.._crit_edge77.us.us.loopexit_crit_edge, label %scalar.ph.preheader.new

scalar.ph.prol.loopexit.._crit_edge77.us.us.loopexit_crit_edge: ; preds = %scalar.ph.prol.loopexit
  br label %._crit_edge77.us.us.loopexit

scalar.ph.preheader.new:                          ; preds = %scalar.ph.prol.loopexit
  br label %scalar.ph

min.iters.checked:                                ; preds = %.preheader67.us.us
  br i1 false, label %min.iters.checked.scalar.ph.preheader_crit_edge, label %vector.memcheck

min.iters.checked.scalar.ph.preheader_crit_edge:  ; preds = %min.iters.checked
  br label %scalar.ph.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep154, %scevgep158159
  %bound1 = icmp ult i8* %scevgep156157, %scevgep155
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %42 to i8*
  %bc160 = bitcast double* %42 to i8*
  %bound0161 = icmp ult i8* %scevgep154, %bc160
  %bound1162 = icmp ult i8* %bc, %scevgep155
  %found.conflict163 = and i1 %bound0161, %bound1162
  %conflict.rdx = or i1 %found.conflict, %found.conflict163
  br i1 %conflict.rdx, label %vector.memcheck.scalar.ph.preheader_crit_edge, label %vector.body.preheader

vector.memcheck.scalar.ph.preheader_crit_edge:    ; preds = %vector.memcheck
  br label %scalar.ph.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %50 = load double, double* %42, align 8, !alias.scope !3
  %51 = insertelement <2 x double> undef, double %50, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  %53 = insertelement <2 x double> undef, double %50, i32 0
  %54 = shufflevector <2 x double> %53, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %55 = or i64 %index, 1
  %56 = or i64 %index, 2
  %57 = or i64 %index, 3
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv117
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %55, i64 %indvars.iv117
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %56, i64 %indvars.iv117
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %57, i64 %indvars.iv117
  %62 = load double, double* %58, align 8, !alias.scope !6
  %63 = load double, double* %59, align 8, !alias.scope !6
  %64 = load double, double* %60, align 8, !alias.scope !6
  %65 = load double, double* %61, align 8, !alias.scope !6
  %66 = insertelement <2 x double> undef, double %62, i32 0
  %67 = insertelement <2 x double> %66, double %63, i32 1
  %68 = insertelement <2 x double> undef, double %64, i32 0
  %69 = insertelement <2 x double> %68, double %65, i32 1
  %70 = fmul <2 x double> %52, %67
  %71 = fmul <2 x double> %54, %69
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv113, i64 %index
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !8, !noalias !10
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !8, !noalias !10
  %76 = fadd <2 x double> %wide.load, %70
  %77 = fadd <2 x double> %wide.load165, %71
  %78 = bitcast double* %72 to <2 x double>*
  store <2 x double> %76, <2 x double>* %78, align 8, !alias.scope !8, !noalias !10
  %79 = bitcast double* %74 to <2 x double>*
  store <2 x double> %77, <2 x double>* %79, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %80 = icmp eq i64 %index.next, 2000
  br i1 %80, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !11

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 true, label %middle.block.._crit_edge77.us.us_crit_edge, label %middle.block.scalar.ph.preheader_crit_edge

middle.block.scalar.ph.preheader_crit_edge:       ; preds = %middle.block
  br label %scalar.ph.preheader

middle.block.._crit_edge77.us.us_crit_edge:       ; preds = %middle.block
  br label %._crit_edge77.us.us

._crit_edge77.us.us.loopexit.unr-lcssa:           ; preds = %scalar.ph
  br label %._crit_edge77.us.us.loopexit

._crit_edge77.us.us.loopexit:                     ; preds = %scalar.ph.prol.loopexit.._crit_edge77.us.us.loopexit_crit_edge, %._crit_edge77.us.us.loopexit.unr-lcssa
  br label %._crit_edge77.us.us

._crit_edge77.us.us:                              ; preds = %middle.block.._crit_edge77.us.us_crit_edge, %._crit_edge77.us.us.loopexit
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next114, 2000
  br i1 %exitcond116, label %._crit_edge79.us, label %._crit_edge77.us.us..preheader67.us.us_crit_edge

._crit_edge77.us.us..preheader67.us.us_crit_edge: ; preds = %._crit_edge77.us.us
  br label %.preheader67.us.us

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader.new
  %indvars.iv109 = phi i64 [ %indvars.iv109.unr.ph, %scalar.ph.preheader.new ], [ %indvars.iv.next110.1, %scalar.ph.scalar.ph_crit_edge ]
  %81 = load double, double* %42, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv117
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv113, i64 %indvars.iv109
  %86 = load double, double* %85, align 8
  %87 = fadd double %86, %84
  store double %87, double* %85, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %88 = load double, double* %42, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next110, i64 %indvars.iv117
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next110
  %93 = load double, double* %92, align 8
  %94 = fadd double %93, %91
  store double %94, double* %92, align 8
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  %exitcond112.1 = icmp eq i64 %indvars.iv.next110.1, 2000
  br i1 %exitcond112.1, label %._crit_edge77.us.us.loopexit.unr-lcssa, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !14

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

.preheader.us.preheader:                          ; preds = %._crit_edge79.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %scevgep175 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 0
  %scevgep175176 = bitcast double* %scevgep175 to i8*
  %scevgep177 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 2000
  %scevgep177178 = bitcast double* %scevgep177 to i8*
  %95 = mul nuw nsw i64 %indvars.iv105, 16000
  %scevgep179 = getelementptr i8, i8* %21, i64 %95
  %96 = add i64 16000, %95
  %scevgep180 = getelementptr i8, i8* %21, i64 %96
  br i1 false, label %.preheader.us.scalar.ph168.preheader_crit_edge, label %min.iters.checked170

.preheader.us.scalar.ph168.preheader_crit_edge:   ; preds = %.preheader.us
  br label %scalar.ph168.preheader

min.iters.checked170:                             ; preds = %.preheader.us
  br i1 false, label %min.iters.checked170.scalar.ph168.preheader_crit_edge, label %vector.memcheck185

min.iters.checked170.scalar.ph168.preheader_crit_edge: ; preds = %min.iters.checked170
  br label %scalar.ph168.preheader

vector.memcheck185:                               ; preds = %min.iters.checked170
  %bound0181 = icmp ult i8* %scevgep175176, %scevgep180
  %bound1182 = icmp ult i8* %scevgep179, %scevgep177178
  %memcheck.conflict184 = and i1 %bound0181, %bound1182
  br i1 %memcheck.conflict184, label %vector.memcheck185.scalar.ph168.preheader_crit_edge, label %vector.body166.preheader

vector.memcheck185.scalar.ph168.preheader_crit_edge: ; preds = %vector.memcheck185
  br label %scalar.ph168.preheader

vector.body166.preheader:                         ; preds = %vector.memcheck185
  br label %vector.body166

vector.body166:                                   ; preds = %vector.body166.vector.body166_crit_edge, %vector.body166.preheader
  %index187 = phi i64 [ %index.next188, %vector.body166.vector.body166_crit_edge ], [ 0, %vector.body166.preheader ]
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv105, i64 %index187
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load195 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !15
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load196 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !15
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %index187
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load195, <2 x i64>* %102, align 8, !alias.scope !18, !noalias !15
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load196, <2 x i64>* %104, align 8, !alias.scope !18, !noalias !15
  %index.next188 = add i64 %index187, 4
  %105 = icmp eq i64 %index.next188, 2000
  br i1 %105, label %middle.block167, label %vector.body166.vector.body166_crit_edge, !llvm.loop !20

vector.body166.vector.body166_crit_edge:          ; preds = %vector.body166
  br label %vector.body166

middle.block167:                                  ; preds = %vector.body166
  br i1 true, label %middle.block167.._crit_edge.us_crit_edge, label %middle.block167.scalar.ph168.preheader_crit_edge

middle.block167.scalar.ph168.preheader_crit_edge: ; preds = %middle.block167
  br label %scalar.ph168.preheader

middle.block167.._crit_edge.us_crit_edge:         ; preds = %middle.block167
  br label %._crit_edge.us

scalar.ph168.preheader:                           ; preds = %middle.block167.scalar.ph168.preheader_crit_edge, %vector.memcheck185.scalar.ph168.preheader_crit_edge, %min.iters.checked170.scalar.ph168.preheader_crit_edge, %.preheader.us.scalar.ph168.preheader_crit_edge
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck185.scalar.ph168.preheader_crit_edge ], [ 0, %min.iters.checked170.scalar.ph168.preheader_crit_edge ], [ 0, %.preheader.us.scalar.ph168.preheader_crit_edge ], [ 2000, %middle.block167.scalar.ph168.preheader_crit_edge ]
  %106 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %scalar.ph168.preheader.scalar.ph168.prol.loopexit_crit_edge, label %scalar.ph168.prol.preheader

scalar.ph168.preheader.scalar.ph168.prol.loopexit_crit_edge: ; preds = %scalar.ph168.preheader
  br label %scalar.ph168.prol.loopexit

scalar.ph168.prol.preheader:                      ; preds = %scalar.ph168.preheader
  br label %scalar.ph168.prol

scalar.ph168.prol:                                ; preds = %scalar.ph168.prol.scalar.ph168.prol_crit_edge, %scalar.ph168.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph168.prol.scalar.ph168.prol_crit_edge ], [ %indvars.iv.ph, %scalar.ph168.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph168.prol.scalar.ph168.prol_crit_edge ], [ 0, %scalar.ph168.prol.preheader ]
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv105, i64 %indvars.iv.prol
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.prol
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph168.prol.loopexit.unr-lcssa, label %scalar.ph168.prol.scalar.ph168.prol_crit_edge, !llvm.loop !21

scalar.ph168.prol.scalar.ph168.prol_crit_edge:    ; preds = %scalar.ph168.prol
  br label %scalar.ph168.prol

scalar.ph168.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph168.prol
  br label %scalar.ph168.prol.loopexit

scalar.ph168.prol.loopexit:                       ; preds = %scalar.ph168.preheader.scalar.ph168.prol.loopexit_crit_edge, %scalar.ph168.prol.loopexit.unr-lcssa
  %112 = icmp ult i64 %106, 3
  br i1 %112, label %scalar.ph168.prol.loopexit.._crit_edge.us.loopexit_crit_edge, label %scalar.ph168.preheader.new

scalar.ph168.prol.loopexit.._crit_edge.us.loopexit_crit_edge: ; preds = %scalar.ph168.prol.loopexit
  br label %._crit_edge.us.loopexit

scalar.ph168.preheader.new:                       ; preds = %scalar.ph168.prol.loopexit
  br label %scalar.ph168

scalar.ph168:                                     ; preds = %scalar.ph168.scalar.ph168_crit_edge, %scalar.ph168.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %scalar.ph168.preheader.new ], [ %indvars.iv.next.3, %scalar.ph168.scalar.ph168_crit_edge ]
  %113 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv105, i64 %indvars.iv
  %114 = bitcast double* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv
  %117 = bitcast double* %116 to i64*
  store i64 %115, i64* %117, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next
  %119 = bitcast double* %118 to i64*
  %120 = load i64, i64* %119, align 8
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.next
  %122 = bitcast double* %121 to i64*
  store i64 %120, i64* %122, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %123 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next.1
  %124 = bitcast double* %123 to i64*
  %125 = load i64, i64* %124, align 8
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.next.1
  %127 = bitcast double* %126 to i64*
  store i64 %125, i64* %127, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %128 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next.2
  %129 = bitcast double* %128 to i64*
  %130 = load i64, i64* %129, align 8
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.next.2
  %132 = bitcast double* %131 to i64*
  store i64 %130, i64* %132, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond104.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond104.3, label %._crit_edge.us.loopexit.unr-lcssa, label %scalar.ph168.scalar.ph168_crit_edge, !llvm.loop !22

scalar.ph168.scalar.ph168_crit_edge:              ; preds = %scalar.ph168
  br label %scalar.ph168

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %scalar.ph168
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %scalar.ph168.prol.loopexit.._crit_edge.us.loopexit_crit_edge, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %middle.block167.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, 2000
  br i1 %exitcond108, label %._crit_edge74.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge74.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge74

._crit_edge74:                                    ; preds = %._crit_edge74.loopexit, %._crit_edge100.thread
  %133 = phi i8* [ %3, %._crit_edge100.thread ], [ %21, %._crit_edge74.loopexit ]
  tail call void @free(i8* %133) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]*) unnamed_addr #0 {
  br i1 true, label %.preheader41.preheader, label %.._crit_edge48_crit_edge

.._crit_edge48_crit_edge:                         ; preds = %2
  br label %._crit_edge48

.preheader41.preheader:                           ; preds = %2
  br label %.preheader41

.preheader41:                                     ; preds = %._crit_edge46..preheader41_crit_edge, %.preheader41.preheader
  %indvars.iv84 = phi i2 [ 0, %.preheader41.preheader ], [ %indvars.iv.next85, %._crit_edge46..preheader41_crit_edge ]
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge46..preheader41_crit_edge ], [ 0, %.preheader41.preheader ]
  %3 = zext i2 %indvars.iv84 to i64
  %4 = add nsw i64 %indvars.iv71, -1
  %5 = icmp sgt i64 %indvars.iv71, 0
  br i1 %5, label %.preheader.preheader, label %.preheader41.._crit_edge46_crit_edge

.preheader41.._crit_edge46_crit_edge:             ; preds = %.preheader41
  br label %._crit_edge46

.preheader.preheader:                             ; preds = %.preheader41
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 0
  br label %.preheader

.lr.ph45:                                         ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv71
  %.pre78 = load double, double* %7, align 8
  %xtraiter79 = and i64 %indvars.iv71, 3
  %lcmp.mod80 = icmp eq i64 %xtraiter79, 0
  br i1 %lcmp.mod80, label %.lr.ph45..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph45..prol.loopexit_crit_edge:                ; preds = %.lr.ph45
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph45
  br label %8

; <label>:8:                                      ; preds = %._crit_edge86, %.prol.preheader
  %9 = phi double [ %.pre78, %.prol.preheader ], [ %13, %._crit_edge86 ]
  %indvars.iv63.prol = phi i64 [ 0, %.prol.preheader ], [ %indvars.iv.next64.prol, %._crit_edge86 ]
  %prol.iter = phi i64 [ %xtraiter79, %.prol.preheader ], [ %prol.iter.sub, %._crit_edge86 ]
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv63.prol
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %11
  %13 = fsub double %9, %12
  store double %13, double* %7, align 8
  %indvars.iv.next64.prol = add nuw nsw i64 %indvars.iv63.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %._crit_edge86, !llvm.loop !23

._crit_edge86:                                    ; preds = %8
  br label %8

.prol.loopexit.unr-lcssa:                         ; preds = %8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph45..prol.loopexit_crit_edge, %.prol.loopexit.unr-lcssa
  %.unr81 = phi double [ %.pre78, %.lr.ph45..prol.loopexit_crit_edge ], [ %13, %.prol.loopexit.unr-lcssa ]
  %indvars.iv63.unr = phi i64 [ 0, %.lr.ph45..prol.loopexit_crit_edge ], [ %3, %.prol.loopexit.unr-lcssa ]
  %14 = icmp ult i64 %4, 3
  br i1 %14, label %.prol.loopexit.._crit_edge46.loopexit_crit_edge, label %.lr.ph45.new

.prol.loopexit.._crit_edge46.loopexit_crit_edge:  ; preds = %.prol.loopexit
  br label %._crit_edge46.loopexit

.lr.ph45.new:                                     ; preds = %.prol.loopexit
  br label %40

.preheader:                                       ; preds = %._crit_edge..preheader_crit_edge, %.preheader.preheader
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %15 = icmp sgt i64 %indvars.iv55, 0
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv55
  %.pre = load double, double* %16, align 8
  br i1 %15, label %.lr.ph.preheader, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv55, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.preheader..lr.ph.prol.loopexit.unr-lcssa_crit_edge, label %.lr.ph.prol.preheader

.lr.ph.preheader..lr.ph.prol.loopexit.unr-lcssa_crit_edge: ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %17 = load double, double* %6, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 0
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %.pre, %20
  store double %21, double* %16, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader..lr.ph.prol.loopexit.unr-lcssa_crit_edge, %.lr.ph.prol
  %.lcssa.unr.ph = phi double [ %21, %.lr.ph.prol ], [ undef, %.lr.ph.preheader..lr.ph.prol.loopexit.unr-lcssa_crit_edge ]
  %.unr.ph = phi double [ %21, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader..lr.ph.prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader..lr.ph.prol.loopexit.unr-lcssa_crit_edge ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %22 = icmp eq i64 %indvars.iv55, 1
  br i1 %22, label %.lr.ph.prol.loopexit.._crit_edge.loopexit_crit_edge, label %.lr.ph.preheader.new

.lr.ph.prol.loopexit.._crit_edge.loopexit_crit_edge: ; preds = %.lr.ph.prol.loopexit
  br label %._crit_edge.loopexit

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader.new
  %23 = phi double [ %.unr.ph, %.lr.ph.preheader.new ], [ %35, %.lr.ph..lr.ph_crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph..lr.ph_crit_edge ]
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv.next
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %29, %34
  store double %35, double* %16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv55
  br i1 %exitcond54.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  br label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit.._crit_edge.loopexit_crit_edge, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit.._crit_edge.loopexit_crit_edge ], [ %35, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader.._crit_edge_crit_edge, %._crit_edge.loopexit
  %36 = phi double [ %.pre, %.preheader.._crit_edge_crit_edge ], [ %.lcssa, %._crit_edge.loopexit ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv55
  %38 = load double, double* %37, align 8
  %39 = fdiv double %36, %38
  store double %39, double* %16, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next56, %indvars.iv71
  br i1 %exitcond62, label %.lr.ph45, label %._crit_edge..preheader_crit_edge

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  br label %.preheader

; <label>:40:                                     ; preds = %._crit_edge87, %.lr.ph45.new
  %41 = phi double [ %.unr81, %.lr.ph45.new ], [ %57, %._crit_edge87 ]
  %indvars.iv63 = phi i64 [ %indvars.iv63.unr, %.lr.ph45.new ], [ %indvars.iv.next64.3, %._crit_edge87 ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv63
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fsub double %41, %44
  store double %45, double* %7, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv.next64
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %7, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv.next64.1
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %7, align 8
  %indvars.iv.next64.2 = add nsw i64 %indvars.iv63, 3
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv.next64.2
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %55
  %57 = fsub double %53, %56
  store double %57, double* %7, align 8
  %indvars.iv.next64.3 = add nsw i64 %indvars.iv63, 4
  %exitcond70.3 = icmp eq i64 %indvars.iv.next64.3, %indvars.iv71
  br i1 %exitcond70.3, label %._crit_edge46.loopexit.unr-lcssa, label %._crit_edge87

._crit_edge87:                                    ; preds = %40
  br label %40

._crit_edge46.loopexit.unr-lcssa:                 ; preds = %40
  br label %._crit_edge46.loopexit

._crit_edge46.loopexit:                           ; preds = %.prol.loopexit.._crit_edge46.loopexit_crit_edge, %._crit_edge46.loopexit.unr-lcssa
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %.preheader41.._crit_edge46_crit_edge, %._crit_edge46.loopexit
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv71
  %59 = load double, double* %58, align 8
  %60 = tail call double @sqrt(double %59) #3
  store double %60, double* %58, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next72, 2000
  %indvars.iv.next85 = add i2 %indvars.iv84, 1
  br i1 %exitcond74, label %._crit_edge48.loopexit, label %._crit_edge46..preheader41_crit_edge

._crit_edge46..preheader41_crit_edge:             ; preds = %._crit_edge46
  br label %.preheader41

._crit_edge48.loopexit:                           ; preds = %._crit_edge46
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %.._crit_edge48_crit_edge, %._crit_edge48.loopexit
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
  br i1 true, label %.preheader.preheader, label %.._crit_edge13_crit_edge

.._crit_edge13_crit_edge:                         ; preds = %2
  br label %._crit_edge13

.preheader.preheader:                             ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %.preheader.preheader
  %indvars.iv22 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next23, %._crit_edge..lr.ph_crit_edge ]
  %indvars.iv20 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next21, %._crit_edge..lr.ph_crit_edge ]
  %7 = mul nsw i64 %indvars.iv22, 2000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge29, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge29 ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge28

._crit_edge28:                                    ; preds = %8
  br label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %._crit_edge28, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, %indvars.iv20
  br i1 %exitcond19, label %._crit_edge, label %._crit_edge29

._crit_edge29:                                    ; preds = %15
  br label %8

._crit_edge:                                      ; preds = %15
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 2000
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  br i1 %exitcond25, label %._crit_edge13.loopexit, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  br label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %._crit_edge13.loopexit
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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

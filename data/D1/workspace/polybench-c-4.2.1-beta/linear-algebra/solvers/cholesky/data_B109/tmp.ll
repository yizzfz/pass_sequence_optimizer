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
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader71.lr.ph, label %._crit_edge100.thread

._crit_edge100.thread:                            ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge74

.preheader71.lr.ph:                               ; preds = %2
  br label %.lr.ph93

.lr.ph93:                                         ; preds = %._crit_edge98, %.preheader71.lr.ph
  %indvars.iv143 = phi i64 [ 0, %.preheader71.lr.ph ], [ %indvars.iv.next144, %._crit_edge98 ]
  %indvars.iv141 = phi i64 [ 1, %.preheader71.lr.ph ], [ %indvars.iv.next142, %._crit_edge98 ]
  %4 = mul nuw nsw i64 %indvars.iv143, 2001
  %5 = add nuw nsw i64 %4, 1
  %6 = sub i64 1998, %indvars.iv143
  %7 = shl i64 %6, 3
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph93
  %indvars.iv127 = phi i64 [ 0, %.lr.ph93 ], [ %indvars.iv.next128, %._crit_edge ]
  %8 = sub nsw i64 0, %indvars.iv127
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv143, i64 %indvars.iv127
  store double %13, double* %14, align 8
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond132 = icmp eq i64 %indvars.iv.next128, %indvars.iv141
  br i1 %exitcond132, label %._crit_edge94, label %._crit_edge

._crit_edge94:                                    ; preds = %._crit_edge
  %scevgep139 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  %15 = and i64 %7, 34359738360
  %scevgep139140 = bitcast double* %scevgep139 to i8*
  %16 = add nuw nsw i64 %15, 8
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %17 = icmp slt i64 %indvars.iv.next144, 2000
  br i1 %17, label %._crit_edge98.loopexit, label %._crit_edge98

._crit_edge98.loopexit:                           ; preds = %._crit_edge94
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep139140, i8 0, i64 %16, i32 8, i1 false)
  br label %._crit_edge98

._crit_edge98:                                    ; preds = %._crit_edge94, %._crit_edge98.loopexit
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv143, i64 %indvars.iv143
  store double 1.000000e+00, double* %18, align 8
  %exitcond154 = icmp eq i64 %indvars.iv.next144, 2000
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  br i1 %exitcond154, label %._crit_edge100, label %.lr.ph93

._crit_edge100:                                   ; preds = %._crit_edge98
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %20 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br i1 true, label %._crit_edge90.us.prol.loopexit, label %._crit_edge90.us.prol.preheader

._crit_edge90.us.prol.preheader:                  ; preds = %._crit_edge100
  br label %._crit_edge90.us.prol

._crit_edge90.us.prol:                            ; preds = %._crit_edge90.us.prol, %._crit_edge90.us.prol.preheader
  %indvars.iv123.prol = phi i64 [ 0, %._crit_edge90.us.prol.preheader ], [ %indvars.iv.next124.prol, %._crit_edge90.us.prol ]
  %prol.iter207 = phi i64 [ 0, %._crit_edge90.us.prol.preheader ], [ %prol.iter207.sub, %._crit_edge90.us.prol ]
  %21 = mul nuw nsw i64 %indvars.iv123.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %19, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.prol = add nuw nsw i64 %indvars.iv123.prol, 1
  %prol.iter207.sub = add nsw i64 %prol.iter207, -1
  %prol.iter207.cmp = icmp eq i64 %prol.iter207.sub, 0
  br i1 %prol.iter207.cmp, label %._crit_edge90.us.prol.loopexit.unr-lcssa, label %._crit_edge90.us.prol, !llvm.loop !1

._crit_edge90.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge90.us.prol
  br label %._crit_edge90.us.prol.loopexit

._crit_edge90.us.prol.loopexit:                   ; preds = %._crit_edge100, %._crit_edge90.us.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader68.lr.ph, label %._crit_edge100.new

._crit_edge100.new:                               ; preds = %._crit_edge90.us.prol.loopexit
  br label %._crit_edge90.us

._crit_edge90.us:                                 ; preds = %._crit_edge90.us, %._crit_edge100.new
  %indvars.iv123 = phi i64 [ 0, %._crit_edge100.new ], [ %indvars.iv.next124.7, %._crit_edge90.us ]
  %22 = mul nuw nsw i64 %indvars.iv123, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %23 = mul i64 %indvars.iv123, 16000
  %24 = add i64 %23, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %25 = mul i64 %indvars.iv123, 16000
  %26 = add i64 %25, 32000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %27 = mul i64 %indvars.iv123, 16000
  %28 = add i64 %27, 48000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %29 = mul i64 %indvars.iv123, 16000
  %30 = add i64 %29, 64000
  %scevgep.4 = getelementptr i8, i8* %19, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %31 = mul i64 %indvars.iv123, 16000
  %32 = add i64 %31, 80000
  %scevgep.5 = getelementptr i8, i8* %19, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %33 = mul i64 %indvars.iv123, 16000
  %34 = add i64 %33, 96000
  %scevgep.6 = getelementptr i8, i8* %19, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %35 = mul i64 %indvars.iv123, 16000
  %36 = add i64 %35, 112000
  %scevgep.7 = getelementptr i8, i8* %19, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.7 = add nsw i64 %indvars.iv123, 8
  %exitcond152.7 = icmp eq i64 %indvars.iv.next124.7, 2000
  br i1 %exitcond152.7, label %.preheader68.lr.ph.unr-lcssa, label %._crit_edge90.us

.preheader68.lr.ph.unr-lcssa:                     ; preds = %._crit_edge90.us
  br label %.preheader68.lr.ph

.preheader68.lr.ph:                               ; preds = %._crit_edge90.us.prol.loopexit, %.preheader68.lr.ph.unr-lcssa
  br label %.preheader67.us.us.preheader

.preheader67.us.us.preheader:                     ; preds = %._crit_edge79.us, %.preheader68.lr.ph
  %indvars.iv115 = phi i64 [ 0, %.preheader68.lr.ph ], [ %indvars.iv.next116, %._crit_edge79.us ]
  %scevgep162 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv115
  %scevgep162163 = bitcast double* %scevgep162 to i8*
  %37 = add nsw i64 %indvars.iv115, -1999
  %scevgep164 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %37
  %scevgep164165 = bitcast double* %scevgep164 to i8*
  br label %.preheader67.us.us

._crit_edge79.us:                                 ; preds = %._crit_edge77.us.us
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond150 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond150, label %.preheader.us.preheader, label %.preheader67.us.us.preheader

.preheader67.us.us:                               ; preds = %._crit_edge77.us.us, %.preheader67.us.us.preheader
  %indvars.iv111 = phi i64 [ 0, %.preheader67.us.us.preheader ], [ %indvars.iv.next112, %._crit_edge77.us.us ]
  %38 = mul nuw nsw i64 %indvars.iv111, 16000
  %scevgep160 = getelementptr i8, i8* %19, i64 %38
  %39 = add i64 16000, %38
  %scevgep161 = getelementptr i8, i8* %19, i64 %39
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111, i64 %indvars.iv115
  br i1 false, label %._crit_edge155.preheader, label %min.iters.checked

._crit_edge155.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader67.us.us
  %indvars.iv107.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader67.us.us ], [ 2000, %middle.block ]
  br i1 true, label %._crit_edge155.prol.loopexit.unr-lcssa, label %._crit_edge155.prol.preheader

._crit_edge155.prol.preheader:                    ; preds = %._crit_edge155.preheader
  br label %._crit_edge155.prol

._crit_edge155.prol:                              ; preds = %._crit_edge155.prol.preheader
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107.ph, i64 %indvars.iv115
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv111, i64 %indvars.iv107.ph
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %45, align 8
  %indvars.iv.next108.prol = add nuw nsw i64 %indvars.iv107.ph, 1
  br label %._crit_edge155.prol.loopexit.unr-lcssa

._crit_edge155.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge155.preheader, %._crit_edge155.prol
  %indvars.iv107.unr.ph = phi i64 [ %indvars.iv.next108.prol, %._crit_edge155.prol ], [ %indvars.iv107.ph, %._crit_edge155.preheader ]
  br label %._crit_edge155.prol.loopexit

._crit_edge155.prol.loopexit:                     ; preds = %._crit_edge155.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge77.us.us.loopexit, label %._crit_edge155.preheader.new

._crit_edge155.preheader.new:                     ; preds = %._crit_edge155.prol.loopexit
  br label %._crit_edge155

min.iters.checked:                                ; preds = %.preheader67.us.us
  br i1 false, label %._crit_edge155.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep160, %scevgep164165
  %bound1 = icmp ult i8* %scevgep162163, %scevgep161
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %40 to i8*
  %bc166 = bitcast double* %40 to i8*
  %bound0167 = icmp ult i8* %scevgep160, %bc166
  %bound1168 = icmp ult i8* %bc, %scevgep161
  %found.conflict169 = and i1 %bound0167, %bound1168
  %conflict.rdx = or i1 %found.conflict, %found.conflict169
  br i1 %conflict.rdx, label %._crit_edge155.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %48 = or i64 %index, 1
  %49 = or i64 %index, 2
  %50 = or i64 %index, 3
  %51 = load double, double* %40, align 8, !alias.scope !3
  %52 = insertelement <2 x double> undef, double %51, i32 0
  %53 = shufflevector <2 x double> %52, <2 x double> undef, <2 x i32> zeroinitializer
  %54 = insertelement <2 x double> undef, double %51, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv115
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %48, i64 %indvars.iv115
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %49, i64 %indvars.iv115
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %50, i64 %indvars.iv115
  %60 = load double, double* %56, align 8, !alias.scope !6
  %61 = load double, double* %57, align 8, !alias.scope !6
  %62 = load double, double* %58, align 8, !alias.scope !6
  %63 = load double, double* %59, align 8, !alias.scope !6
  %64 = insertelement <2 x double> undef, double %60, i32 0
  %65 = insertelement <2 x double> %64, double %61, i32 1
  %66 = insertelement <2 x double> undef, double %62, i32 0
  %67 = insertelement <2 x double> %66, double %63, i32 1
  %68 = fmul <2 x double> %53, %65
  %69 = fmul <2 x double> %55, %67
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv111, i64 %index
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !8, !noalias !10
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load171 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !8, !noalias !10
  %74 = fadd <2 x double> %wide.load, %68
  %75 = fadd <2 x double> %wide.load171, %69
  %76 = bitcast double* %70 to <2 x double>*
  store <2 x double> %74, <2 x double>* %76, align 8, !alias.scope !8, !noalias !10
  %77 = bitcast double* %72 to <2 x double>*
  store <2 x double> %75, <2 x double>* %77, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %78 = icmp eq i64 %index.next, 2000
  br i1 %78, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge77.us.us, label %._crit_edge155.preheader

._crit_edge77.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge155
  br label %._crit_edge77.us.us.loopexit

._crit_edge77.us.us.loopexit:                     ; preds = %._crit_edge155.prol.loopexit, %._crit_edge77.us.us.loopexit.unr-lcssa
  br label %._crit_edge77.us.us

._crit_edge77.us.us:                              ; preds = %._crit_edge77.us.us.loopexit, %middle.block
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond149 = icmp eq i64 %indvars.iv.next112, 2000
  br i1 %exitcond149, label %._crit_edge79.us, label %.preheader67.us.us

._crit_edge155:                                   ; preds = %._crit_edge155, %._crit_edge155.preheader.new
  %indvars.iv107 = phi i64 [ %indvars.iv107.unr.ph, %._crit_edge155.preheader.new ], [ %indvars.iv.next108.1, %._crit_edge155 ]
  %79 = load double, double* %40, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv115
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv111, i64 %indvars.iv107
  %84 = load double, double* %83, align 8
  %85 = fadd double %84, %82
  store double %85, double* %83, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %86 = load double, double* %40, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next108, i64 %indvars.iv115
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv111, i64 %indvars.iv.next108
  %91 = load double, double* %90, align 8
  %92 = fadd double %91, %89
  store double %92, double* %90, align 8
  %indvars.iv.next108.1 = add nsw i64 %indvars.iv107, 2
  %exitcond148.1 = icmp eq i64 %indvars.iv.next108.1, 2000
  br i1 %exitcond148.1, label %._crit_edge77.us.us.loopexit.unr-lcssa, label %._crit_edge155, !llvm.loop !14

.preheader.us.preheader:                          ; preds = %._crit_edge79.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv103 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next104, %._crit_edge.us ]
  %scevgep181 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 0
  %scevgep181182 = bitcast double* %scevgep181 to i8*
  %scevgep183 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 2000
  %scevgep183184 = bitcast double* %scevgep183 to i8*
  %93 = mul nuw nsw i64 %indvars.iv103, 16000
  %scevgep185 = getelementptr i8, i8* %19, i64 %93
  %94 = add i64 16000, %93
  %scevgep186 = getelementptr i8, i8* %19, i64 %94
  br i1 false, label %._crit_edge156.preheader, label %min.iters.checked176

min.iters.checked176:                             ; preds = %.preheader.us
  br i1 false, label %._crit_edge156.preheader, label %vector.memcheck191

vector.memcheck191:                               ; preds = %min.iters.checked176
  %bound0187 = icmp ult i8* %scevgep181182, %scevgep186
  %bound1188 = icmp ult i8* %scevgep185, %scevgep183184
  %memcheck.conflict190 = and i1 %bound0187, %bound1188
  br i1 %memcheck.conflict190, label %._crit_edge156.preheader, label %vector.body172.preheader

vector.body172.preheader:                         ; preds = %vector.memcheck191
  br label %vector.body172

vector.body172:                                   ; preds = %vector.body172.preheader, %vector.body172
  %index193 = phi i64 [ %index.next194, %vector.body172 ], [ 0, %vector.body172.preheader ]
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv103, i64 %index193
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load201 = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !15
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load202 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !15
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %index193
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load201, <2 x i64>* %100, align 8, !alias.scope !18, !noalias !15
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load202, <2 x i64>* %102, align 8, !alias.scope !18, !noalias !15
  %index.next194 = add i64 %index193, 4
  %103 = icmp eq i64 %index.next194, 2000
  br i1 %103, label %middle.block173, label %vector.body172, !llvm.loop !20

middle.block173:                                  ; preds = %vector.body172
  br i1 true, label %._crit_edge.us, label %._crit_edge156.preheader

._crit_edge156.preheader:                         ; preds = %middle.block173, %vector.memcheck191, %min.iters.checked176, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck191 ], [ 0, %min.iters.checked176 ], [ 0, %.preheader.us ], [ 2000, %middle.block173 ]
  %104 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge156.prol.loopexit, label %._crit_edge156.prol.preheader

._crit_edge156.prol.preheader:                    ; preds = %._crit_edge156.preheader
  br label %._crit_edge156.prol

._crit_edge156.prol:                              ; preds = %._crit_edge156.prol, %._crit_edge156.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge156.prol ], [ %indvars.iv.ph, %._crit_edge156.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge156.prol ], [ 0, %._crit_edge156.prol.preheader ]
  %105 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv103, i64 %indvars.iv.prol
  %106 = bitcast double* %105 to i64*
  %107 = load i64, i64* %106, align 8
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.prol
  %109 = bitcast double* %108 to i64*
  store i64 %107, i64* %109, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge156.prol.loopexit.unr-lcssa, label %._crit_edge156.prol, !llvm.loop !21

._crit_edge156.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge156.prol
  br label %._crit_edge156.prol.loopexit

._crit_edge156.prol.loopexit:                     ; preds = %._crit_edge156.preheader, %._crit_edge156.prol.loopexit.unr-lcssa
  %110 = icmp ult i64 %104, 3
  br i1 %110, label %._crit_edge.us.loopexit, label %._crit_edge156.preheader.new

._crit_edge156.preheader.new:                     ; preds = %._crit_edge156.prol.loopexit
  br label %._crit_edge156

._crit_edge156:                                   ; preds = %._crit_edge156, %._crit_edge156.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge156.preheader.new ], [ %indvars.iv.next.3, %._crit_edge156 ]
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv103, i64 %indvars.iv
  %112 = bitcast double* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.next
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.1
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.next.1
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.2
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.next.2
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond147.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond147.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge156, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge156
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge156.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block173
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond = icmp eq i64 %indvars.iv.next104, 2000
  br i1 %exitcond, label %._crit_edge74.loopexit, label %.preheader.us

._crit_edge74.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge74

._crit_edge74:                                    ; preds = %._crit_edge74.loopexit, %._crit_edge100.thread
  %131 = phi i8* [ %3, %._crit_edge100.thread ], [ %19, %._crit_edge74.loopexit ]
  tail call void @free(i8* %131) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader41.preheader, label %._crit_edge48

.preheader41.preheader:                           ; preds = %2
  br label %.preheader41

.preheader41:                                     ; preds = %._crit_edge46, %.preheader41.preheader
  %indvars.iv76 = phi i2 [ %indvars.iv.next77, %._crit_edge46 ], [ 0, %.preheader41.preheader ]
  %indvars.iv62 = phi i64 [ 0, %.preheader41.preheader ], [ %indvars.iv.next63, %._crit_edge46 ]
  %3 = zext i2 %indvars.iv76 to i64
  %4 = add nsw i64 %indvars.iv62, -1
  %5 = icmp sgt i64 %indvars.iv62, 0
  br i1 %5, label %.preheader.preheader, label %._crit_edge46

.preheader.preheader:                             ; preds = %.preheader41
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 0
  br label %.preheader

.lr.ph45:                                         ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv62
  %.pre70 = load double, double* %7, align 8
  %xtraiter71 = and i64 %indvars.iv62, 3
  %lcmp.mod72 = icmp eq i64 %xtraiter71, 0
  br i1 %lcmp.mod72, label %._crit_edge68.prol.loopexit, label %._crit_edge68.prol.preheader

._crit_edge68.prol.preheader:                     ; preds = %.lr.ph45
  br label %._crit_edge68.prol

._crit_edge68.prol:                               ; preds = %._crit_edge68.prol, %._crit_edge68.prol.preheader
  %8 = phi double [ %.pre70, %._crit_edge68.prol.preheader ], [ %12, %._crit_edge68.prol ]
  %indvars.iv57.prol = phi i64 [ 0, %._crit_edge68.prol.preheader ], [ %indvars.iv.next58.prol, %._crit_edge68.prol ]
  %prol.iter = phi i64 [ %xtraiter71, %._crit_edge68.prol.preheader ], [ %prol.iter.sub, %._crit_edge68.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv57.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next58.prol = add nuw nsw i64 %indvars.iv57.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge68.prol.loopexit.unr-lcssa, label %._crit_edge68.prol, !llvm.loop !23

._crit_edge68.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge68.prol
  br label %._crit_edge68.prol.loopexit

._crit_edge68.prol.loopexit:                      ; preds = %.lr.ph45, %._crit_edge68.prol.loopexit.unr-lcssa
  %.unr73 = phi double [ %.pre70, %.lr.ph45 ], [ %12, %._crit_edge68.prol.loopexit.unr-lcssa ]
  %indvars.iv57.unr = phi i64 [ 0, %.lr.ph45 ], [ %3, %._crit_edge68.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge46.loopexit, label %.lr.ph45.new

.lr.ph45.new:                                     ; preds = %._crit_edge68.prol.loopexit
  br label %._crit_edge68

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %._crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv51, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv51
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge67.preheader, label %._crit_edge

._crit_edge67.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv51, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge67.prol.loopexit.unr-lcssa, label %._crit_edge67.prol.preheader

._crit_edge67.prol.preheader:                     ; preds = %._crit_edge67.preheader
  br label %._crit_edge67.prol

._crit_edge67.prol:                               ; preds = %._crit_edge67.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv51, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge67.prol.loopexit.unr-lcssa

._crit_edge67.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge67.preheader, %._crit_edge67.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge67.prol ], [ undef, %._crit_edge67.preheader ]
  %.unr.ph = phi double [ %20, %._crit_edge67.prol ], [ %.pre, %._crit_edge67.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge67.prol ], [ 0, %._crit_edge67.preheader ]
  br label %._crit_edge67.prol.loopexit

._crit_edge67.prol.loopexit:                      ; preds = %._crit_edge67.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv51, 1
  br i1 %21, label %._crit_edge.loopexit, label %._crit_edge67.preheader.new

._crit_edge67.preheader.new:                      ; preds = %._crit_edge67.prol.loopexit
  br label %._crit_edge67

._crit_edge67:                                    ; preds = %._crit_edge67, %._crit_edge67.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge67.preheader.new ], [ %34, %._crit_edge67 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge67.preheader.new ], [ %indvars.iv.next.1, %._crit_edge67 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv51
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge67

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge67
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge67.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge67.prol.loopexit ], [ %34, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %35 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv51
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next52, %indvars.iv62
  br i1 %exitcond56, label %.lr.ph45, label %.preheader

._crit_edge68:                                    ; preds = %._crit_edge68, %.lr.ph45.new
  %39 = phi double [ %.unr73, %.lr.ph45.new ], [ %55, %._crit_edge68 ]
  %indvars.iv57 = phi i64 [ %indvars.iv57.unr, %.lr.ph45.new ], [ %indvars.iv.next58.3, %._crit_edge68 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv57
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv.next58
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv.next58.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next58.2 = add nsw i64 %indvars.iv57, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv.next58.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next58.3 = add nuw nsw i64 %indvars.iv57, 4
  %exitcond61.3 = icmp eq i64 %indvars.iv.next58.3, %indvars.iv62
  br i1 %exitcond61.3, label %._crit_edge46.loopexit.unr-lcssa, label %._crit_edge68

._crit_edge46.loopexit.unr-lcssa:                 ; preds = %._crit_edge68
  br label %._crit_edge46.loopexit

._crit_edge46.loopexit:                           ; preds = %._crit_edge68.prol.loopexit, %._crit_edge46.loopexit.unr-lcssa
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %.preheader41
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv62
  %57 = load double, double* %56, align 8
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %56, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next63, 2000
  %indvars.iv.next77 = add i2 %indvars.iv76, 1
  br i1 %exitcond66, label %._crit_edge48.loopexit, label %.preheader41

._crit_edge48.loopexit:                           ; preds = %._crit_edge46
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit, %2
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
  %indvars.iv18 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next19, %._crit_edge ]
  %indvars.iv16 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next17, %._crit_edge ]
  %7 = mul nsw i64 %indvars.iv18, 2000
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge23, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge23 ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge23

; <label>:12:                                     ; preds = %._crit_edge24
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge24, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv16
  br i1 %exitcond, label %._crit_edge, label %._crit_edge24

._crit_edge:                                      ; preds = %._crit_edge23
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next19, 2000
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  br i1 %exitcond22, label %._crit_edge13.loopexit, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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

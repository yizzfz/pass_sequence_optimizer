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
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.preheader74.lr.ph:
  br label %.lr.ph96

.lr.ph96:                                         ; preds = %.lr.ph96.backedge, %.preheader74.lr.ph
  %indvars.iv141 = phi i64 [ 0, %.preheader74.lr.ph ], [ %indvars.iv.next142, %.lr.ph96.backedge ]
  %indvars.iv139 = phi i64 [ 1, %.preheader74.lr.ph ], [ %indvars.iv139.be, %.lr.ph96.backedge ]
  %1 = mul i64 %indvars.iv141, 2001
  %2 = add i64 %1, 1
  %3 = mul i64 %indvars.iv141, -8
  br label %8

.preheader73:                                     ; preds = %8
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %4 = icmp slt i64 %indvars.iv.next142, 2000
  br i1 %4, label %._crit_edge98.thread, label %._crit_edge98

._crit_edge98.thread:                             ; preds = %.preheader73
  %5 = add i64 %3, 15992
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %2
  %6 = bitcast double* %scevgep149 to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 %5, i32 8, i1 false)
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv141, i64 %indvars.iv141
  store double 1.000000e+00, double* %7, align 8
  br label %.lr.ph96.backedge

; <label>:8:                                      ; preds = %8, %.lr.ph96
  %indvars.iv127 = phi i64 [ 0, %.lr.ph96 ], [ %indvars.iv.next128, %8 ]
  %9 = sub nsw i64 0, %indvars.iv127
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2000
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+03
  %14 = fadd double %13, 1.000000e+00
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv141, i64 %indvars.iv127
  store double %14, double* %15, align 8
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond132 = icmp eq i64 %indvars.iv.next128, %indvars.iv139
  br i1 %exitcond132, label %.preheader73, label %8

._crit_edge98:                                    ; preds = %.preheader73
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv141, i64 %indvars.iv141
  store double 1.000000e+00, double* %16, align 8
  %exitcond144 = icmp eq i64 %indvars.iv.next142, 2000
  br i1 %exitcond144, label %.preheader72.us.preheader, label %.lr.ph96.backedge

.lr.ph96.backedge:                                ; preds = %._crit_edge98, %._crit_edge98.thread
  %indvars.iv139.be = add nuw nsw i64 %indvars.iv139, 1
  br label %.lr.ph96

.preheader72.us.preheader:                        ; preds = %._crit_edge98
  %17 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge93.us

._crit_edge93.us:                                 ; preds = %._crit_edge93.us, %.preheader72.us.preheader
  %indvars.iv123 = phi i64 [ 0, %.preheader72.us.preheader ], [ %indvars.iv.next124.7, %._crit_edge93.us ]
  %18 = mul nuw nsw i64 %indvars.iv123, 16000
  %scevgep = getelementptr i8, i8* %17, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124 = or i64 %indvars.iv123, 1
  %19 = mul nuw nsw i64 %indvars.iv.next124, 16000
  %scevgep.1 = getelementptr i8, i8* %17, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.1 = or i64 %indvars.iv123, 2
  %20 = mul nuw nsw i64 %indvars.iv.next124.1, 16000
  %scevgep.2 = getelementptr i8, i8* %17, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.2 = or i64 %indvars.iv123, 3
  %21 = mul nuw nsw i64 %indvars.iv.next124.2, 16000
  %scevgep.3 = getelementptr i8, i8* %17, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.3 = or i64 %indvars.iv123, 4
  %22 = mul nuw nsw i64 %indvars.iv.next124.3, 16000
  %scevgep.4 = getelementptr i8, i8* %17, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.4 = or i64 %indvars.iv123, 5
  %23 = mul nuw nsw i64 %indvars.iv.next124.4, 16000
  %scevgep.5 = getelementptr i8, i8* %17, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.5 = or i64 %indvars.iv123, 6
  %24 = mul nuw nsw i64 %indvars.iv.next124.5, 16000
  %scevgep.6 = getelementptr i8, i8* %17, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.6 = or i64 %indvars.iv123, 7
  %25 = mul nuw nsw i64 %indvars.iv.next124.6, 16000
  %scevgep.7 = getelementptr i8, i8* %17, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next124.7 = add nsw i64 %indvars.iv123, 8
  %exitcond126.7 = icmp eq i64 %indvars.iv.next124.7, 2000
  br i1 %exitcond126.7, label %.preheader69.us.us.preheader.preheader, label %._crit_edge93.us

.preheader69.us.us.preheader.preheader:           ; preds = %._crit_edge93.us
  %26 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %27 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %28 = bitcast i8* %17 to [2000 x [2000 x double]]*
  br label %.preheader69.us.us.preheader

.preheader69.us.us.preheader:                     ; preds = %.preheader69.us.us.preheader.preheader, %._crit_edge82.us
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %._crit_edge82.us ], [ 0, %.preheader69.us.us.preheader.preheader ]
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv115
  %29 = add nuw nsw i64 %indvars.iv115, 1
  %scevgep7 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %29
  %30 = bitcast double* %scevgep7 to i8*
  %31 = bitcast double* %scevgep5 to i8*
  br label %.preheader69.us.us

._crit_edge82.us:                                 ; preds = %._crit_edge80.us.us
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond118, label %.preheader.us.preheader, label %.preheader69.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge82.us
  %32 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %33 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %34 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %38 = bitcast i8* %17 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader69.us.us:                               ; preds = %._crit_edge80.us.us, %.preheader69.us.us.preheader
  %indvars.iv111 = phi i64 [ 0, %.preheader69.us.us.preheader ], [ %indvars.iv.next112, %._crit_edge80.us.us ]
  %39 = mul nuw nsw i64 %indvars.iv111, 16000
  %scevgep3 = getelementptr i8, i8* %17, i64 %39
  %40 = add nuw nsw i64 %39, 16000
  %scevgep4 = getelementptr i8, i8* %17, i64 %40
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv111, i64 %indvars.iv115
  %bound0 = icmp ult i8* %scevgep3, %30
  %bound1 = icmp ult i8* %31, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %41 to i8*
  %bc9 = bitcast double* %41 to i8*
  %bound010 = icmp ult i8* %scevgep3, %bc9
  %bound111 = icmp ult i8* %bc, %scevgep4
  %found.conflict12 = and i1 %bound010, %bound111
  %conflict.rdx = or i1 %found.conflict, %found.conflict12
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader69.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader69.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %42 = or i64 %index, 1
  %43 = or i64 %index, 2
  %44 = or i64 %index, 3
  %45 = load double, double* %41, align 8, !alias.scope !1
  %46 = insertelement <2 x double> undef, double %45, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = insertelement <2 x double> undef, double %45, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv115
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %42, i64 %indvars.iv115
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %43, i64 %indvars.iv115
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %44, i64 %indvars.iv115
  %54 = load double, double* %50, align 8, !alias.scope !4
  %55 = load double, double* %51, align 8, !alias.scope !4
  %56 = load double, double* %52, align 8, !alias.scope !4
  %57 = load double, double* %53, align 8, !alias.scope !4
  %58 = insertelement <2 x double> undef, double %54, i32 0
  %59 = insertelement <2 x double> %58, double %55, i32 1
  %60 = insertelement <2 x double> undef, double %56, i32 0
  %61 = insertelement <2 x double> %60, double %57, i32 1
  %62 = fmul <2 x double> %47, %59
  %63 = fmul <2 x double> %49, %61
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv111, i64 %index
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !6, !noalias !8
  %68 = fadd <2 x double> %wide.load, %62
  %69 = fadd <2 x double> %wide.load14, %63
  %70 = bitcast double* %64 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8, !alias.scope !6, !noalias !8
  %71 = bitcast double* %66 to <2 x double>*
  store <2 x double> %69, <2 x double>* %71, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %72 = icmp eq i64 %index.next, 2000
  br i1 %72, label %._crit_edge80.us.us.loopexit45, label %vector.body, !llvm.loop !9

._crit_edge80.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge80.us.us

._crit_edge80.us.us.loopexit45:                   ; preds = %vector.body
  br label %._crit_edge80.us.us

._crit_edge80.us.us:                              ; preds = %._crit_edge80.us.us.loopexit45, %._crit_edge80.us.us.loopexit
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next112, 2000
  br i1 %exitcond114, label %._crit_edge82.us, label %.preheader69.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv107 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next108.1, %scalar.ph ]
  %73 = load double, double* %41, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv107, i64 %indvars.iv115
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv111, i64 %indvars.iv107
  %78 = load double, double* %77, align 8
  %79 = fadd double %78, %76
  store double %79, double* %77, align 8
  %indvars.iv.next108 = or i64 %indvars.iv107, 1
  %80 = load double, double* %41, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next108, i64 %indvars.iv115
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv111, i64 %indvars.iv.next108
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  store double %86, double* %84, align 8
  %indvars.iv.next108.1 = add nsw i64 %indvars.iv107, 2
  %exitcond110.1 = icmp eq i64 %indvars.iv.next108.1, 2000
  br i1 %exitcond110.1, label %._crit_edge80.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %87 = add nuw nsw i64 %indvars.iv102, 1
  %scevgep22 = getelementptr [2000 x double], [2000 x double]* %0, i64 %87, i64 0
  %scevgep2223 = bitcast double* %scevgep22 to i8*
  %88 = mul nuw nsw i64 %indvars.iv102, 16000
  %scevgep24 = getelementptr i8, i8* %17, i64 %88
  %89 = add nuw nsw i64 %88, 16000
  %scevgep25 = getelementptr i8, i8* %17, i64 %89
  %bound026 = icmp ult i8* %scevgep2021, %scevgep25
  %bound127 = icmp ult i8* %scevgep24, %scevgep2223
  %memcheck.conflict29 = and i1 %bound026, %bound127
  br i1 %memcheck.conflict29, label %scalar.ph17.preheader, label %vector.body15.preheader

vector.body15.preheader:                          ; preds = %.preheader.us
  br label %vector.body15

scalar.ph17.preheader:                            ; preds = %.preheader.us
  br label %scalar.ph17

vector.body15:                                    ; preds = %vector.body15, %vector.body15.preheader
  %index32 = phi i64 [ 0, %vector.body15.preheader ], [ %index.next33.1, %vector.body15 ]
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv102, i64 %index32
  %91 = bitcast double* %90 to <2 x i64>*
  %wide.load40 = load <2 x i64>, <2 x i64>* %91, align 8, !alias.scope !13
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x i64>*
  %wide.load41 = load <2 x i64>, <2 x i64>* %93, align 8, !alias.scope !13
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %index32
  %95 = bitcast double* %94 to <2 x i64>*
  store <2 x i64> %wide.load40, <2 x i64>* %95, align 8, !alias.scope !16, !noalias !13
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x i64>*
  store <2 x i64> %wide.load41, <2 x i64>* %97, align 8, !alias.scope !16, !noalias !13
  %index.next33 = or i64 %index32, 4
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv102, i64 %index.next33
  %99 = bitcast double* %98 to <2 x i64>*
  %wide.load40.1 = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !13
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load41.1 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %index.next33
  %103 = bitcast double* %102 to <2 x i64>*
  store <2 x i64> %wide.load40.1, <2 x i64>* %103, align 8, !alias.scope !16, !noalias !13
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load41.1, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %index.next33.1 = add nsw i64 %index32, 8
  %106 = icmp eq i64 %index.next33.1, 2000
  br i1 %106, label %._crit_edge.us.loopexit44, label %vector.body15, !llvm.loop !18

scalar.ph17:                                      ; preds = %scalar.ph17, %scalar.ph17.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph17.preheader ], [ %indvars.iv.next.4, %scalar.ph17 ]
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv102, i64 %indvars.iv
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv.next
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next.1
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv.next.1
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next.2
  %123 = bitcast double* %122 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv.next.2
  %126 = bitcast double* %125 to i64*
  store i64 %124, i64* %126, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next.3
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv.next.3
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph17, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph17
  br label %._crit_edge.us

._crit_edge.us.loopexit44:                        ; preds = %vector.body15
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit44, %._crit_edge.us.loopexit
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next103, 2000
  br i1 %exitcond105, label %._crit_edge77, label %.preheader.us

._crit_edge77:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %17) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader44.preheader:
  br label %.preheader44

.preheader44:                                     ; preds = %._crit_edge51, %.preheader44.preheader
  %indvars.iv73 = phi i64 [ 0, %.preheader44.preheader ], [ %indvars.iv.next74, %._crit_edge51 ]
  %1 = icmp sgt i64 %indvars.iv73, 0
  br i1 %1, label %.preheader42.preheader, label %._crit_edge51

.preheader42.preheader:                           ; preds = %.preheader44
  %2 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73, i64 0
  br label %.preheader42

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge49.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge49.us ], [ %indvars.iv73, %.preheader.us.preheader ]
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73, i64 %indvars.iv69
  %.pre80 = load double, double* %3, align 8
  br i1 %lcmp.mod2, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  br label %4

; <label>:4:                                      ; preds = %.prol.preheader
  %5 = load double, double* %50, align 8
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv69
  %7 = load double, double* %6, align 8
  %8 = fmul double %5, %7
  %9 = fsub double %.pre80, %8
  store double %9, double* %3, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader.us, %4
  %.unr3.ph = phi double [ %9, %4 ], [ %.pre80, %.preheader.us ]
  %indvars.iv64.unr.ph = phi i64 [ 1, %4 ], [ 0, %.preheader.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %49, label %._crit_edge49.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader.us.new
  %11 = phi double [ %.unr3.ph, %.preheader.us.new ], [ %23, %10 ]
  %indvars.iv64 = phi i64 [ %indvars.iv64.unr.ph, %.preheader.us.new ], [ %indvars.iv.next65.1, %10 ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73, i64 %indvars.iv64
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv69
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fsub double %11, %16
  store double %17, double* %3, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73, i64 %indvars.iv.next65
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next65, i64 %indvars.iv69
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %3, align 8
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64, 2
  %exitcond66.1 = icmp eq i64 %indvars.iv.next65.1, %indvars.iv73
  br i1 %exitcond66.1, label %._crit_edge49.us.unr-lcssa, label %10

._crit_edge49.us.unr-lcssa:                       ; preds = %10
  br label %._crit_edge49.us

._crit_edge49.us:                                 ; preds = %.prol.loopexit, %._crit_edge49.us.unr-lcssa
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, 2000
  br i1 %exitcond72, label %._crit_edge51.loopexit, label %.preheader.us

.preheader42:                                     ; preds = %.preheader42.preheader, %._crit_edge
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge ], [ 0, %.preheader42.preheader ]
  %24 = icmp sgt i64 %indvars.iv59, 0
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73, i64 %indvars.iv59
  %.pre = load double, double* %25, align 8
  br i1 %24, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader42
  %xtraiter = and i64 %indvars.iv59, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %26 = load double, double* %2, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv59
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %.pre, %29
  store double %30, double* %25, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.lcssa.unr.ph = phi double [ %30, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %30, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %31 = icmp eq i64 %indvars.iv59, 1
  br i1 %31, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %32 = phi double [ %.unr.ph, %.lr.ph.preheader.new ], [ %44, %.lr.ph ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv59
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %32, %37
  store double %38, double* %25, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73, i64 %indvars.iv.next
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv59
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  store double %44, double* %25, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv59
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %44, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader42
  %45 = phi double [ %.pre, %.preheader42 ], [ %.lcssa, %._crit_edge.loopexit ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  %47 = load double, double* %46, align 8
  %48 = fdiv double %45, %47
  store double %48, double* %25, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %indvars.iv73
  br i1 %exitcond62, label %.preheader.us.preheader, label %.preheader42

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter1 = and i64 %indvars.iv73, 1
  %lcmp.mod2 = icmp eq i64 %xtraiter1, 0
  %49 = icmp eq i64 %indvars.iv73, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73, i64 0
  br label %.preheader.us

._crit_edge51.loopexit:                           ; preds = %._crit_edge49.us
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %.preheader44
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, 2000
  br i1 %exitcond76, label %._crit_edge55, label %.preheader44

._crit_edge55:                                    ; preds = %._crit_edge51
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge13.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge13.us ]
  %5 = mul nuw nsw i64 %indvars.iv16, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge13.us, label %6

._crit_edge13.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond19, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge13.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}

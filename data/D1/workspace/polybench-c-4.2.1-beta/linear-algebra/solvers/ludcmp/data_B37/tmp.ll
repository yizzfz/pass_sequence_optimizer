; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge19

.._crit_edge_crit_edge19:                         ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge19, %.._crit_edge_crit_edge, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge100.._crit_edge100_crit_edge, %5
  %indvars.iv132 = phi i64 [ 0, %5 ], [ %indvars.iv.next133, %._crit_edge100.._crit_edge100_crit_edge ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv132
  store double 0.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds double, double* %4, i64 %indvars.iv132
  store double 0.000000e+00, double* %7, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %8 = trunc i64 %indvars.iv.next133 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 2.000000e+03
  %11 = fmul double %10, 5.000000e-01
  %12 = fadd double %11, 4.000000e+00
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv132
  store double %12, double* %13, align 8
  %exitcond134 = icmp eq i64 %indvars.iv132, 1999
  br i1 %exitcond134, label %._crit_edge100..lr.ph_crit_edge, label %._crit_edge100.._crit_edge100_crit_edge

._crit_edge100.._crit_edge100_crit_edge:          ; preds = %._crit_edge100
  br label %._crit_edge100

._crit_edge100..lr.ph_crit_edge:                  ; preds = %._crit_edge100
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge100..lr.ph_crit_edge, %._crit_edge97..preheader84_crit_edge
  %indvars.iv130 = phi i64 [ %indvars.iv.next131, %._crit_edge97..preheader84_crit_edge ], [ 0, %._crit_edge100..lr.ph_crit_edge ]
  %14 = shl i64 %indvars.iv130, 32
  %sext = add i64 %14, 4294967296
  %15 = ashr exact i64 %sext, 32
  %scevgep137 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv130, i64 %15
  %scevgep137138 = bitcast double* %scevgep137 to i8*
  %16 = ashr exact i64 %sext, 29
  %17 = sub nsw i64 16000, %16
  br label %19

.preheader83:                                     ; preds = %19
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %18 = icmp slt i64 %indvars.iv.next131, 2000
  br i1 %18, label %._crit_edge97..preheader84_crit_edge, label %28

; <label>:19:                                     ; preds = %._crit_edge178, %.lr.ph
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %._crit_edge178 ], [ 0, %.lr.ph ]
  %20 = sub nsw i64 0, %indvars.iv120
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 2000
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 2.000000e+03
  %25 = fadd double %24, 1.000000e+00
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv130, i64 %indvars.iv120
  store double %25, double* %26, align 8
  %exitcond124 = icmp eq i64 %indvars.iv120, %indvars.iv130
  br i1 %exitcond124, label %.preheader83, label %._crit_edge178

._crit_edge178:                                   ; preds = %19
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  br label %19

._crit_edge97..preheader84_crit_edge:             ; preds = %.preheader83
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep137138, i8 0, i64 %17, i32 8, i1 false)
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv130, i64 %indvars.iv130
  store double 1.000000e+00, double* %27, align 8
  br label %.lr.ph

; <label>:28:                                     ; preds = %.preheader83
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv130, i64 %indvars.iv130
  store double 1.000000e+00, double* %29, align 8
  %30 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %..preheader82_crit_edge

..preheader82_crit_edge:                          ; preds = %..preheader82_crit_edge...preheader82_crit_edge_crit_edge, %28
  %indvars.iv118 = phi i64 [ 0, %28 ], [ %indvars.iv.next119, %..preheader82_crit_edge...preheader82_crit_edge_crit_edge ]
  %31 = mul i64 %indvars.iv118, 16000
  %scevgep = getelementptr i8, i8* %30, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119 = add nuw i64 %indvars.iv118, 1
  %32 = icmp slt i64 %indvars.iv.next119, 2000
  br i1 %32, label %..preheader82_crit_edge...preheader82_crit_edge_crit_edge, label %.._crit_edge.preheader_crit_edge

..preheader82_crit_edge...preheader82_crit_edge_crit_edge: ; preds = %..preheader82_crit_edge
  br label %..preheader82_crit_edge

.._crit_edge.preheader_crit_edge:                 ; preds = %..preheader82_crit_edge
  %33 = bitcast i8* %30 to [2000 x [2000 x double]]*
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %.._crit_edge.preheader_crit_edge179, %.._crit_edge.preheader_crit_edge
  %indvars.iv113 = phi i64 [ 0, %.._crit_edge.preheader_crit_edge ], [ %34, %.._crit_edge.preheader_crit_edge179 ]
  %scevgep141 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv113
  %scevgep141142 = bitcast double* %scevgep141 to i8*
  %34 = add i64 %indvars.iv113, 1
  %scevgep143 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %34
  %scevgep143144 = bitcast double* %scevgep143 to i8*
  br label %.preheader80

.preheader80:                                     ; preds = %._crit_edge..preheader80_crit_edge, %._crit_edge.preheader
  %indvars.iv111 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next112, %._crit_edge..preheader80_crit_edge ]
  %35 = mul i64 %indvars.iv111, 16000
  %scevgep139 = getelementptr i8, i8* %30, i64 %35
  %36 = add i64 %35, 16000
  %scevgep140 = getelementptr i8, i8* %30, i64 %36
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111, i64 %indvars.iv113
  %bound0 = icmp ult i8* %scevgep139, %scevgep143144
  %bound1 = icmp ult i8* %scevgep141142, %scevgep140
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %37 to i8*
  %bound0146 = icmp ult i8* %scevgep139, %bc
  %bound1147 = icmp ult i8* %bc, %scevgep140
  %found.conflict148 = and i1 %bound0146, %bound1147
  %conflict.rdx = or i1 %found.conflict, %found.conflict148
  br i1 %conflict.rdx, label %.preheader80.scalar.ph_crit_edge, label %.preheader80.vector.body_crit_edge

.preheader80.vector.body_crit_edge:               ; preds = %.preheader80
  br label %vector.body

.preheader80.scalar.ph_crit_edge:                 ; preds = %.preheader80
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %.preheader80.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %.preheader80.vector.body_crit_edge ]
  %38 = or i64 %index, 1
  %39 = or i64 %index, 2
  %40 = or i64 %index, 3
  %41 = load double, double* %37, align 8, !alias.scope !1
  %42 = insertelement <2 x double> undef, double %41, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv113
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %38, i64 %indvars.iv113
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %39, i64 %indvars.iv113
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %40, i64 %indvars.iv113
  %48 = load double, double* %44, align 8, !alias.scope !4
  %49 = load double, double* %45, align 8, !alias.scope !4
  %50 = load double, double* %46, align 8, !alias.scope !4
  %51 = load double, double* %47, align 8, !alias.scope !4
  %52 = insertelement <2 x double> undef, double %48, i32 0
  %53 = insertelement <2 x double> %52, double %49, i32 1
  %54 = insertelement <2 x double> undef, double %50, i32 0
  %55 = insertelement <2 x double> %54, double %51, i32 1
  %56 = fmul <2 x double> %43, %53
  %57 = fmul <2 x double> %43, %55
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv111, i64 %index
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load150 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !6, !noalias !8
  %62 = fadd <2 x double> %wide.load, %56
  %63 = fadd <2 x double> %wide.load150, %57
  store <2 x double> %62, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %63, <2 x double>* %61, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %64 = icmp eq i64 %index.next, 2000
  br i1 %64, label %vector.body.._crit_edge_crit_edge, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

vector.body.._crit_edge_crit_edge:                ; preds = %vector.body
  br label %._crit_edge

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %.preheader80.scalar.ph_crit_edge
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %scalar.ph.scalar.ph_crit_edge ], [ 0, %.preheader80.scalar.ph_crit_edge ]
  %65 = load double, double* %37, align 8
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv113
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv111, i64 %indvars.iv108
  %70 = load double, double* %69, align 8
  %71 = fadd double %70, %68
  store double %71, double* %69, align 8
  %exitcond110 = icmp eq i64 %indvars.iv108, 1999
  br i1 %exitcond110, label %scalar.ph.._crit_edge_crit_edge, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !12

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  br label %scalar.ph

scalar.ph.._crit_edge_crit_edge:                  ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %scalar.ph.._crit_edge_crit_edge, %vector.body.._crit_edge_crit_edge
  %indvars.iv.next112 = add nuw i64 %indvars.iv111, 1
  %72 = icmp slt i64 %indvars.iv.next112, 2000
  br i1 %72, label %._crit_edge..preheader80_crit_edge, label %73

._crit_edge..preheader80_crit_edge:               ; preds = %._crit_edge
  br label %.preheader80

; <label>:73:                                     ; preds = %._crit_edge
  %74 = icmp slt i64 %34, 2000
  br i1 %74, label %.._crit_edge.preheader_crit_edge179, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %73
  br label %.preheader

.._crit_edge.preheader_crit_edge179:              ; preds = %73
  br label %._crit_edge.preheader

.preheader:                                       ; preds = %._crit_edge1..preheader_crit_edge, %..preheader_crit_edge
  %indvars.iv106 = phi i64 [ %75, %._crit_edge1..preheader_crit_edge ], [ 0, %..preheader_crit_edge ]
  %scevgep156 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 0
  %scevgep156157 = bitcast double* %scevgep156 to i8*
  %75 = add i64 %indvars.iv106, 1
  %scevgep158 = getelementptr [2000 x double], [2000 x double]* %1, i64 %75, i64 0
  %scevgep158159 = bitcast double* %scevgep158 to i8*
  %76 = mul i64 %indvars.iv106, 16000
  %scevgep160 = getelementptr i8, i8* %30, i64 %76
  %77 = add i64 %76, 16000
  %scevgep161 = getelementptr i8, i8* %30, i64 %77
  %bound0162 = icmp ult i8* %scevgep156157, %scevgep161
  %bound1163 = icmp ult i8* %scevgep160, %scevgep158159
  %memcheck.conflict165 = and i1 %bound0162, %bound1163
  br i1 %memcheck.conflict165, label %.preheader.scalar.ph153_crit_edge, label %.preheader.vector.body151_crit_edge

.preheader.vector.body151_crit_edge:              ; preds = %.preheader
  br label %vector.body151

.preheader.scalar.ph153_crit_edge:                ; preds = %.preheader
  br label %scalar.ph153

vector.body151:                                   ; preds = %vector.body151.vector.body151_crit_edge, %.preheader.vector.body151_crit_edge
  %index168 = phi i64 [ %index.next169, %vector.body151.vector.body151_crit_edge ], [ 0, %.preheader.vector.body151_crit_edge ]
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv106, i64 %index168
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load176 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !13
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x i64>*
  %wide.load177 = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !13
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %index168
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load176, <2 x i64>* %83, align 8, !alias.scope !16, !noalias !13
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x i64>*
  store <2 x i64> %wide.load177, <2 x i64>* %85, align 8, !alias.scope !16, !noalias !13
  %index.next169 = add i64 %index168, 4
  %86 = icmp eq i64 %index.next169, 2000
  br i1 %86, label %vector.body151.._crit_edge1_crit_edge, label %vector.body151.vector.body151_crit_edge, !llvm.loop !18

vector.body151.vector.body151_crit_edge:          ; preds = %vector.body151
  br label %vector.body151

vector.body151.._crit_edge1_crit_edge:            ; preds = %vector.body151
  br label %._crit_edge1

scalar.ph153:                                     ; preds = %scalar.ph153.scalar.ph153_crit_edge, %.preheader.scalar.ph153_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph153.scalar.ph153_crit_edge ], [ 0, %.preheader.scalar.ph153_crit_edge ]
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv106, i64 %indvars.iv
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv
  %91 = bitcast double* %90 to i64*
  store i64 %89, i64* %91, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond, label %scalar.ph153.._crit_edge1_crit_edge, label %scalar.ph153.scalar.ph153_crit_edge, !llvm.loop !19

scalar.ph153.scalar.ph153_crit_edge:              ; preds = %scalar.ph153
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %scalar.ph153

scalar.ph153.._crit_edge1_crit_edge:              ; preds = %scalar.ph153
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %scalar.ph153.._crit_edge1_crit_edge, %vector.body151.._crit_edge1_crit_edge
  %92 = icmp slt i64 %75, 2000
  br i1 %92, label %._crit_edge1..preheader_crit_edge, label %93

._crit_edge1..preheader_crit_edge:                ; preds = %._crit_edge1
  br label %.preheader

; <label>:93:                                     ; preds = %._crit_edge1
  tail call void @free(i8* nonnull %30) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader95

.preheader95:                                     ; preds = %._crit_edge128..preheader95_crit_edge, %5
  %indvars.iv179 = phi i32 [ %indvars.iv.next180, %._crit_edge128..preheader95_crit_edge ], [ -1, %5 ]
  %indvars.iv170 = phi i64 [ %indvars.iv.next171, %._crit_edge128..preheader95_crit_edge ], [ 0, %5 ]
  %6 = sub i64 2000, %indvars.iv170
  %7 = zext i32 %indvars.iv179 to i64
  %8 = icmp sgt i64 %indvars.iv170, 0
  br i1 %8, label %.preheader95..lr.ph118_crit_edge, label %.preheader95..lr.ph127.split.preheader_crit_edge

.preheader95..lr.ph127.split.preheader_crit_edge: ; preds = %.preheader95
  br label %.lr.ph127.split.preheader

.preheader95..lr.ph118_crit_edge:                 ; preds = %.preheader95
  br label %.lr.ph118

.lr.ph127.split.preheader:                        ; preds = %.lr.ph127..lr.ph127.split.preheader_crit_edge, %.preheader95..lr.ph127.split.preheader_crit_edge
  %min.iters.check = icmp ult i64 %6, 4
  br i1 %min.iters.check, label %.lr.ph127.split.preheader..lr.ph127.split_crit_edge, label %min.iters.checked

.lr.ph127.split.preheader..lr.ph127.split_crit_edge: ; preds = %.lr.ph127.split.preheader
  br label %.lr.ph127.split.preheader193

min.iters.checked:                                ; preds = %.lr.ph127.split.preheader
  %n.vec = and i64 %6, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv170, %n.vec
  br i1 %cmp.zero, label %min.iters.checked..lr.ph127.split_crit_edge, label %min.iters.checked.vector.body_crit_edge

min.iters.checked.vector.body_crit_edge:          ; preds = %min.iters.checked
  br label %vector.body

min.iters.checked..lr.ph127.split_crit_edge:      ; preds = %min.iters.checked
  br label %.lr.ph127.split.preheader193

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %min.iters.checked.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %min.iters.checked.vector.body_crit_edge ]
  %9 = add i64 %indvars.iv170, %index
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv170, i64 %9
  %11 = bitcast double* %10 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %11, align 8
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x i64>*
  %wide.load191 = load <2 x i64>, <2 x i64>* %13, align 8
  store <2 x i64> %wide.load, <2 x i64>* %11, align 8
  store <2 x i64> %wide.load191, <2 x i64>* %13, align 8
  %index.next = add i64 %index, 4
  %14 = icmp eq i64 %index.next, %n.vec
  br i1 %14, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !20

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %6, %n.vec
  br i1 %cmp.n, label %middle.block.._crit_edge128_crit_edge, label %middle.block..lr.ph127.split_crit_edge

middle.block..lr.ph127.split_crit_edge:           ; preds = %middle.block
  br label %.lr.ph127.split.preheader193

.lr.ph127.split.preheader193:                     ; preds = %.lr.ph127.split.preheader..lr.ph127.split_crit_edge, %min.iters.checked..lr.ph127.split_crit_edge, %middle.block..lr.ph127.split_crit_edge
  %indvars.iv157.ph = phi i64 [ %indvars.iv170, %min.iters.checked..lr.ph127.split_crit_edge ], [ %indvars.iv170, %.lr.ph127.split.preheader..lr.ph127.split_crit_edge ], [ %ind.end, %middle.block..lr.ph127.split_crit_edge ]
  br label %.lr.ph127.split

middle.block.._crit_edge128_crit_edge:            ; preds = %middle.block
  br label %._crit_edge128

.lr.ph127:                                        ; preds = %._crit_edge115
  br i1 true, label %.lr.ph127..lr.ph127.split.us_crit_edge, label %.lr.ph127..lr.ph127.split.preheader_crit_edge

.lr.ph127..lr.ph127.split.preheader_crit_edge:    ; preds = %.lr.ph127
  br label %.lr.ph127.split.preheader

.lr.ph127..lr.ph127.split.us_crit_edge:           ; preds = %.lr.ph127
  br label %.lr.ph127.split.us

.lr.ph127.split.us:                               ; preds = %._crit_edge123.us..lr.ph127.split.us_crit_edge, %.lr.ph127..lr.ph127.split.us_crit_edge
  %indvars.iv168 = phi i64 [ %indvars.iv.next169, %._crit_edge123.us..lr.ph127.split.us_crit_edge ], [ %indvars.iv170, %.lr.ph127..lr.ph127.split.us_crit_edge ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv170, i64 %indvars.iv168
  %16 = load double, double* %15, align 8
  br label %17

; <label>:17:                                     ; preds = %._crit_edge192, %.lr.ph127.split.us
  %indvars.iv160 = phi i64 [ %indvars.iv.next161, %._crit_edge192 ], [ 0, %.lr.ph127.split.us ]
  %.1120.us = phi double [ %23, %._crit_edge192 ], [ %16, %.lr.ph127.split.us ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv170, i64 %indvars.iv160
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv160, i64 %indvars.iv168
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %.1120.us, %22
  %exitcond181 = icmp eq i64 %indvars.iv160, %7
  br i1 %exitcond181, label %._crit_edge123.us, label %._crit_edge192

._crit_edge192:                                   ; preds = %17
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  br label %17

._crit_edge123.us:                                ; preds = %17
  store double %23, double* %15, align 8
  %indvars.iv.next169 = add nuw i64 %indvars.iv168, 1
  %24 = icmp slt i64 %indvars.iv.next169, 2000
  br i1 %24, label %._crit_edge123.us..lr.ph127.split.us_crit_edge, label %._crit_edge123.us.._crit_edge128_crit_edge

._crit_edge123.us.._crit_edge128_crit_edge:       ; preds = %._crit_edge123.us
  br label %._crit_edge128

._crit_edge123.us..lr.ph127.split.us_crit_edge:   ; preds = %._crit_edge123.us
  br label %.lr.ph127.split.us

.lr.ph118:                                        ; preds = %._crit_edge115..lr.ph118_crit_edge, %.preheader95..lr.ph118_crit_edge
  %indvars.iv175 = phi i32 [ %indvars.iv.next176, %._crit_edge115..lr.ph118_crit_edge ], [ -1, %.preheader95..lr.ph118_crit_edge ]
  %indvars.iv153 = phi i64 [ %indvars.iv.next154, %._crit_edge115..lr.ph118_crit_edge ], [ 0, %.preheader95..lr.ph118_crit_edge ]
  %25 = zext i32 %indvars.iv175 to i64
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv170, i64 %indvars.iv153
  %27 = load double, double* %26, align 8
  %28 = icmp sgt i64 %indvars.iv153, 0
  br i1 %28, label %.lr.ph118..lr.ph114_crit_edge, label %.lr.ph118.._crit_edge115_crit_edge

.lr.ph118.._crit_edge115_crit_edge:               ; preds = %.lr.ph118
  br label %._crit_edge115

.lr.ph118..lr.ph114_crit_edge:                    ; preds = %.lr.ph118
  br label %.lr.ph114

.lr.ph114:                                        ; preds = %.lr.ph114..lr.ph114_crit_edge, %.lr.ph118..lr.ph114_crit_edge
  %indvars.iv147 = phi i64 [ %indvars.iv.next148, %.lr.ph114..lr.ph114_crit_edge ], [ 0, %.lr.ph118..lr.ph114_crit_edge ]
  %.0112 = phi double [ %34, %.lr.ph114..lr.ph114_crit_edge ], [ %27, %.lr.ph118..lr.ph114_crit_edge ]
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv170, i64 %indvars.iv147
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv153
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %.0112, %33
  %exitcond177 = icmp eq i64 %indvars.iv147, %25
  br i1 %exitcond177, label %.lr.ph114.._crit_edge115_crit_edge, label %.lr.ph114..lr.ph114_crit_edge

.lr.ph114..lr.ph114_crit_edge:                    ; preds = %.lr.ph114
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  br label %.lr.ph114

.lr.ph114.._crit_edge115_crit_edge:               ; preds = %.lr.ph114
  br label %._crit_edge115

._crit_edge115:                                   ; preds = %.lr.ph114.._crit_edge115_crit_edge, %.lr.ph118.._crit_edge115_crit_edge
  %.0.lcssa = phi double [ %27, %.lr.ph118.._crit_edge115_crit_edge ], [ %34, %.lr.ph114.._crit_edge115_crit_edge ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv153, i64 %indvars.iv153
  %36 = load double, double* %35, align 8
  %37 = fdiv double %.0.lcssa, %36
  store double %37, double* %26, align 8
  %indvars.iv.next154 = add nuw i64 %indvars.iv153, 1
  %38 = icmp slt i64 %indvars.iv.next154, %indvars.iv170
  br i1 %38, label %._crit_edge115..lr.ph118_crit_edge, label %.lr.ph127

._crit_edge115..lr.ph118_crit_edge:               ; preds = %._crit_edge115
  %indvars.iv.next176 = add i32 %indvars.iv175, 1
  br label %.lr.ph118

.lr.ph127.split:                                  ; preds = %.lr.ph127.split.preheader193, %.lr.ph127.split..lr.ph127.split_crit_edge
  %indvars.iv157 = phi i64 [ %indvars.iv.next158, %.lr.ph127.split..lr.ph127.split_crit_edge ], [ %indvars.iv157.ph, %.lr.ph127.split.preheader193 ]
  %exitcond159 = icmp eq i64 %indvars.iv157, 1999
  br i1 %exitcond159, label %.lr.ph127.split.._crit_edge128_crit_edge, label %.lr.ph127.split..lr.ph127.split_crit_edge, !llvm.loop !21

.lr.ph127.split..lr.ph127.split_crit_edge:        ; preds = %.lr.ph127.split
  %indvars.iv.next158 = add nuw i64 %indvars.iv157, 1
  br label %.lr.ph127.split

.lr.ph127.split.._crit_edge128_crit_edge:         ; preds = %.lr.ph127.split
  br label %._crit_edge128

._crit_edge128:                                   ; preds = %.lr.ph127.split.._crit_edge128_crit_edge, %._crit_edge123.us.._crit_edge128_crit_edge, %middle.block.._crit_edge128_crit_edge
  %indvars.iv.next171 = add nuw i64 %indvars.iv170, 1
  %39 = icmp slt i64 %indvars.iv.next171, 2000
  br i1 %39, label %._crit_edge128..preheader95_crit_edge, label %._crit_edge128..preheader93_crit_edge

._crit_edge128..preheader93_crit_edge:            ; preds = %._crit_edge128
  br label %.preheader93

._crit_edge128..preheader95_crit_edge:            ; preds = %._crit_edge128
  %indvars.iv.next180 = add i32 %indvars.iv179, 1
  br label %.preheader95

.preheader93:                                     ; preds = %._crit_edge107..preheader93_crit_edge, %._crit_edge128..preheader93_crit_edge
  %indvars.iv172 = phi i32 [ %indvars.iv.next173, %._crit_edge107..preheader93_crit_edge ], [ -1, %._crit_edge128..preheader93_crit_edge ]
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %._crit_edge107..preheader93_crit_edge ], [ 0, %._crit_edge128..preheader93_crit_edge ]
  %40 = zext i32 %indvars.iv172 to i64
  %41 = getelementptr inbounds double, double* %2, i64 %indvars.iv145
  %42 = load double, double* %41, align 8
  %43 = icmp sgt i64 %indvars.iv145, 0
  br i1 %43, label %.preheader93..lr.ph106_crit_edge, label %.preheader93.._crit_edge107_crit_edge

.preheader93.._crit_edge107_crit_edge:            ; preds = %.preheader93
  br label %._crit_edge107

.preheader93..lr.ph106_crit_edge:                 ; preds = %.preheader93
  br label %.lr.ph106

.lr.ph106:                                        ; preds = %.lr.ph106..lr.ph106_crit_edge, %.preheader93..lr.ph106_crit_edge
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %.lr.ph106..lr.ph106_crit_edge ], [ 0, %.preheader93..lr.ph106_crit_edge ]
  %.2104 = phi double [ %49, %.lr.ph106..lr.ph106_crit_edge ], [ %42, %.preheader93..lr.ph106_crit_edge ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv145, i64 %indvars.iv140
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds double, double* %4, i64 %indvars.iv140
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %.2104, %48
  %exitcond174 = icmp eq i64 %indvars.iv140, %40
  br i1 %exitcond174, label %.lr.ph106.._crit_edge107_crit_edge, label %.lr.ph106..lr.ph106_crit_edge

.lr.ph106..lr.ph106_crit_edge:                    ; preds = %.lr.ph106
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  br label %.lr.ph106

.lr.ph106.._crit_edge107_crit_edge:               ; preds = %.lr.ph106
  br label %._crit_edge107

._crit_edge107:                                   ; preds = %.lr.ph106.._crit_edge107_crit_edge, %.preheader93.._crit_edge107_crit_edge
  %.2.lcssa = phi double [ %42, %.preheader93.._crit_edge107_crit_edge ], [ %49, %.lr.ph106.._crit_edge107_crit_edge ]
  %50 = getelementptr inbounds double, double* %4, i64 %indvars.iv145
  store double %.2.lcssa, double* %50, align 8
  %indvars.iv.next146 = add nuw i64 %indvars.iv145, 1
  %51 = icmp slt i64 %indvars.iv.next146, 2000
  br i1 %51, label %._crit_edge107..preheader93_crit_edge, label %._crit_edge107..preheader_crit_edge

._crit_edge107..preheader_crit_edge:              ; preds = %._crit_edge107
  br label %.preheader

._crit_edge107..preheader93_crit_edge:            ; preds = %._crit_edge107
  %indvars.iv.next173 = add i32 %indvars.iv172, 1
  br label %.preheader93

.preheader:                                       ; preds = %._crit_edge107..preheader_crit_edge, %._crit_edge..preheader_crit_edge
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %._crit_edge..preheader_crit_edge ], [ 1999, %._crit_edge107..preheader_crit_edge ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge..preheader_crit_edge ], [ 2000, %._crit_edge107..preheader_crit_edge ]
  %52 = getelementptr inbounds double, double* %4, i64 %indvars.iv138
  %53 = load double, double* %52, align 8
  %54 = icmp slt i32 %indvars.iv, 2000
  br i1 %54, label %.preheader..lr.ph_crit_edge, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  br label %._crit_edge

.preheader..lr.ph_crit_edge:                      ; preds = %.preheader
  %55 = sext i32 %indvars.iv to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.preheader..lr.ph_crit_edge
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %.lr.ph..lr.ph_crit_edge ], [ %55, %.preheader..lr.ph_crit_edge ]
  %.399 = phi double [ %61, %.lr.ph..lr.ph_crit_edge ], [ %53, %.preheader..lr.ph_crit_edge ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds double, double* %3, i64 %indvars.iv136
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fsub double %.399, %60
  %exitcond = icmp eq i64 %indvars.iv136, 1999
  br i1 %exitcond, label %.lr.ph.._crit_edge_crit_edge, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  %indvars.iv.next137 = add nsw i64 %indvars.iv136, 1
  br label %.lr.ph

.lr.ph.._crit_edge_crit_edge:                     ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.._crit_edge_crit_edge, %.preheader.._crit_edge_crit_edge
  %.3.lcssa = phi double [ %53, %.preheader.._crit_edge_crit_edge ], [ %61, %.lr.ph.._crit_edge_crit_edge ]
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv138
  %63 = load double, double* %62, align 8
  %64 = fdiv double %.3.lcssa, %63
  %65 = getelementptr inbounds double, double* %3, i64 %indvars.iv138
  store double %64, double* %65, align 8
  %66 = icmp sgt i64 %indvars.iv138, 0
  br i1 %66, label %._crit_edge..preheader_crit_edge, label %67

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %indvars.iv.next139 = add i64 %indvars.iv138, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  br label %.preheader

; <label>:67:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge.._crit_edge._crit_edge_crit_edge, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge.._crit_edge._crit_edge_crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge._crit_edge.._crit_edge_crit_edge

._crit_edge._crit_edge.._crit_edge_crit_edge:     ; preds = %._crit_edge._crit_edge
  br label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.._crit_edge_crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %16 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %16, label %._crit_edge.._crit_edge._crit_edge_crit_edge, label %17

._crit_edge.._crit_edge._crit_edge_crit_edge:     ; preds = %._crit_edge
  br label %._crit_edge._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
!20 = distinct !{!20, !10, !11}
!21 = distinct !{!21, !22, !10, !11}
!22 = !{!"llvm.loop.unroll.runtime.disable"}

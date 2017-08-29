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
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %4)
  call void (...) @polybench_timer_start() #4
  %5 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @kernel_lu([2000 x double]* %5)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %6 = icmp sgt i32 %0, 42
  br i1 %6, label %7, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:7:                                      ; preds = %2
  %8 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %8, align 1
  %9 = icmp eq i8 %strcmpload, 0
  br i1 %9, label %10, label %.._crit_edge_crit_edge9

.._crit_edge_crit_edge9:                          ; preds = %7
  br label %._crit_edge

; <label>:10:                                     ; preds = %7
  %11 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @print_array([2000 x double]* %11)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge9, %.._crit_edge_crit_edge, %10
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.preheader74.lr.ph:
  br label %.lr.ph89

.lr.ph89:                                         ; preds = %._crit_edge91..lr.ph89_crit_edge, %.preheader74.lr.ph
  %indvars.iv149 = phi i64 [ 0, %.preheader74.lr.ph ], [ %indvars.iv.next150, %._crit_edge91..lr.ph89_crit_edge ]
  %indvars.iv147 = phi i64 [ 1, %.preheader74.lr.ph ], [ %indvars.iv.next148, %._crit_edge91..lr.ph89_crit_edge ]
  %1 = mul nuw nsw i64 %indvars.iv149, 2001
  %2 = add nuw nsw i64 %1, 1
  %scevgep145 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %2
  %3 = sub i64 1998, %indvars.iv149
  %4 = shl i64 %3, 3
  %5 = and i64 %4, 34359738360
  br label %._crit_edge

.preheader73:                                     ; preds = %._crit_edge
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %6 = icmp slt i64 %indvars.iv.next150, 2000
  br i1 %6, label %._crit_edge91.loopexit, label %.preheader73.._crit_edge91_crit_edge

.preheader73.._crit_edge91_crit_edge:             ; preds = %.preheader73
  br label %._crit_edge91

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.lr.ph89
  %indvars.iv133 = phi i64 [ 0, %.lr.ph89 ], [ %indvars.iv.next134, %._crit_edge.._crit_edge_crit_edge ]
  %7 = sub nsw i64 0, %indvars.iv133
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv149, i64 %indvars.iv133
  store double %12, double* %13, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next134, %indvars.iv147
  br i1 %exitcond138, label %.preheader73, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge91.loopexit:                           ; preds = %.preheader73
  %14 = add nuw nsw i64 %5, 8
  %scevgep145146 = bitcast double* %scevgep145 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep145146, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge91

._crit_edge91:                                    ; preds = %.preheader73.._crit_edge91_crit_edge, %._crit_edge91.loopexit
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv149, i64 %indvars.iv149
  store double 1.000000e+00, double* %15, align 8
  %exitcond152 = icmp eq i64 %indvars.iv.next150, 2000
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  br i1 %exitcond152, label %._crit_edge93, label %._crit_edge91..lr.ph89_crit_edge

._crit_edge91..lr.ph89_crit_edge:                 ; preds = %._crit_edge91
  br label %.lr.ph89

._crit_edge93:                                    ; preds = %._crit_edge91
  %16 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %17 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %._crit_edge86.us.3

.preheader69.us.us.preheader:                     ; preds = %._crit_edge82.us..preheader69.us.us.preheader_crit_edge, %.preheader69.us.us.preheader.preheader
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %._crit_edge82.us..preheader69.us.us.preheader_crit_edge ], [ 0, %.preheader69.us.us.preheader.preheader ]
  br label %.preheader69.us.us

._crit_edge82.us:                                 ; preds = %._crit_edge80.us.us
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond121 = icmp eq i64 %indvars.iv.next119, 2000
  br i1 %exitcond121, label %.preheader.us.preheader, label %._crit_edge82.us..preheader69.us.us.preheader_crit_edge

._crit_edge82.us..preheader69.us.us.preheader_crit_edge: ; preds = %._crit_edge82.us
  br label %.preheader69.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge82.us
  br label %.preheader.us

.preheader69.us.us:                               ; preds = %._crit_edge80.us.us..preheader69.us.us_crit_edge, %.preheader69.us.us.preheader
  %indvars.iv114 = phi i64 [ 0, %.preheader69.us.us.preheader ], [ %indvars.iv.next115, %._crit_edge80.us.us..preheader69.us.us_crit_edge ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv114, i64 %indvars.iv118
  br label %.preheader69.us.us.new

._crit_edge80.us.us:                              ; preds = %.preheader69.us.us.new
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next115, 2000
  br i1 %exitcond117, label %._crit_edge82.us, label %._crit_edge80.us.us..preheader69.us.us_crit_edge

._crit_edge80.us.us..preheader69.us.us_crit_edge: ; preds = %._crit_edge80.us.us
  br label %.preheader69.us.us

.preheader69.us.us.new:                           ; preds = %.preheader69.us.us.new..preheader69.us.us.new_crit_edge, %.preheader69.us.us
  %indvars.iv106 = phi i64 [ %indvars.iv.next107.1, %.preheader69.us.us.new..preheader69.us.us.new_crit_edge ], [ 0, %.preheader69.us.us ]
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv118
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv114, i64 %indvars.iv106
  %24 = load double, double* %23, align 8
  %25 = fadd double %24, %22
  store double %25, double* %23, align 8
  %indvars.iv.next107 = or i64 %indvars.iv106, 1
  %26 = load double, double* %18, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next107, i64 %indvars.iv118
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv114, i64 %indvars.iv.next107
  %31 = load double, double* %30, align 8
  %32 = fadd double %31, %29
  store double %32, double* %30, align 8
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %exitcond109.1 = icmp eq i64 %indvars.iv.next107.1, 2000
  br i1 %exitcond109.1, label %._crit_edge80.us.us, label %.preheader69.us.us.new..preheader69.us.us.new_crit_edge

.preheader69.us.us.new..preheader69.us.us.new_crit_edge: ; preds = %.preheader69.us.us.new
  br label %.preheader69.us.us.new

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new..preheader.us.new_crit_edge ], [ 0, %.preheader.us ]
  %33 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv103, i64 %indvars.iv
  %34 = bitcast double* %33 to i64*
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv
  %37 = bitcast double* %36 to i64*
  store i64 %35, i64* %37, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %38 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next
  %39 = bitcast double* %38 to i64*
  %40 = load i64, i64* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv.next
  %42 = bitcast double* %41 to i64*
  store i64 %40, i64* %42, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %43 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.1
  %44 = bitcast double* %43 to i64*
  %45 = load i64, i64* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv.next.1
  %47 = bitcast double* %46 to i64*
  store i64 %45, i64* %47, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %48 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.2
  %49 = bitcast double* %48 to i64*
  %50 = load i64, i64* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv.next.2
  %52 = bitcast double* %51 to i64*
  store i64 %50, i64* %52, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond = icmp eq i64 %indvars.iv.next104, 2000
  br i1 %exitcond, label %._crit_edge77, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge77:                                    ; preds = %._crit_edge.us
  call void @free(i8* %16) #4
  ret void

._crit_edge86.us.3:                               ; preds = %._crit_edge86.us.3.._crit_edge86.us.3_crit_edge, %._crit_edge93
  %indvars.iv126 = phi i64 [ 0, %._crit_edge93 ], [ %indvars.iv.next127.3.1, %._crit_edge86.us.3.._crit_edge86.us.3_crit_edge ]
  %53 = mul nuw nsw i64 %indvars.iv126, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %53
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %54 = mul nuw nsw i64 %indvars.iv126, 16000
  %55 = add nuw nsw i64 %54, 16000
  %scevgep.1 = getelementptr i8, i8* %16, i64 %55
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %56 = mul nuw nsw i64 %indvars.iv126, 16000
  %57 = add nuw nsw i64 %56, 32000
  %scevgep.2 = getelementptr i8, i8* %16, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %58 = mul nuw nsw i64 %indvars.iv126, 16000
  %59 = add nuw nsw i64 %58, 48000
  %scevgep.3 = getelementptr i8, i8* %16, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.3 = or i64 %indvars.iv126, 4
  %60 = mul nuw nsw i64 %indvars.iv.next127.3, 16000
  %scevgep.11 = getelementptr i8, i8* %16, i64 %60
  call void @llvm.memset.p0i8.i64(i8* %scevgep.11, i8 0, i64 16000, i32 8, i1 false)
  %61 = mul nuw nsw i64 %indvars.iv.next127.3, 16000
  %62 = add nuw nsw i64 %61, 16000
  %scevgep.1.1 = getelementptr i8, i8* %16, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %63 = mul nuw nsw i64 %indvars.iv.next127.3, 16000
  %64 = add nuw nsw i64 %63, 32000
  %scevgep.2.1 = getelementptr i8, i8* %16, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %65 = mul nuw nsw i64 %indvars.iv.next127.3, 16000
  %66 = add nuw nsw i64 %65, 48000
  %scevgep.3.1 = getelementptr i8, i8* %16, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.3.1 = add nsw i64 %indvars.iv126, 8
  %exitcond129.3.1 = icmp eq i64 %indvars.iv.next127.3.1, 2000
  br i1 %exitcond129.3.1, label %.preheader69.us.us.preheader.preheader, label %._crit_edge86.us.3.._crit_edge86.us.3_crit_edge

._crit_edge86.us.3.._crit_edge86.us.3_crit_edge:  ; preds = %._crit_edge86.us.3
  br label %._crit_edge86.us.3

.preheader69.us.us.preheader.preheader:           ; preds = %._crit_edge86.us.3
  br label %.preheader69.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
..preheader44_crit_edge:
  br label %.preheader44

.preheader44:                                     ; preds = %._crit_edge51..preheader44_crit_edge, %..preheader44_crit_edge
  %indvars.iv83 = phi i64 [ 0, %..preheader44_crit_edge ], [ %indvars.iv.next84, %._crit_edge51..preheader44_crit_edge ]
  %1 = add nuw i64 %indvars.iv83, 4294967295
  %2 = icmp sgt i64 %indvars.iv83, 0
  br i1 %2, label %.preheader44..preheader42_crit_edge, label %.preheader44.._crit_edge51_crit_edge

.preheader44.._crit_edge51_crit_edge:             ; preds = %.preheader44
  br label %._crit_edge51

.preheader44..preheader42_crit_edge:              ; preds = %.preheader44
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83, i64 0
  br label %.preheader42

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %4 = icmp sgt i64 %indvars.iv83, 0
  br i1 %4, label %.preheader.lr.ph..preheader.us_crit_edge, label %.preheader.lr.ph.._crit_edge51_crit_edge

.preheader.lr.ph.._crit_edge51_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge51

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %.preheader.lr.ph
  %xtraiter7387 = and i64 %indvars.iv83, 1
  %lcmp.mod74 = icmp eq i64 %xtraiter7387, 0
  %5 = trunc i64 %1 to i32
  %6 = icmp eq i32 %5, 0
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83, i64 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge49.us..preheader.us_crit_edge, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv77 = phi i64 [ %indvars.iv83, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next78, %._crit_edge49.us..preheader.us_crit_edge ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83, i64 %indvars.iv77
  br i1 %lcmp.mod74, label %.preheader.us..prol.loopexit72_crit_edge, label %.prol.preheader71

.preheader.us..prol.loopexit72_crit_edge:         ; preds = %.preheader.us
  br label %.prol.loopexit72

.prol.preheader71:                                ; preds = %.preheader.us
  %9 = load double, double* %7, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv77
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = load double, double* %8, align 8
  %14 = fsub double %13, %12
  store double %14, double* %8, align 8
  br label %.prol.loopexit72

.prol.loopexit72:                                 ; preds = %.preheader.us..prol.loopexit72_crit_edge, %.prol.preheader71
  %indvars.iv66.unr.ph = phi i64 [ 1, %.prol.preheader71 ], [ 0, %.preheader.us..prol.loopexit72_crit_edge ]
  br i1 %6, label %.prol.loopexit72.._crit_edge49.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit72.._crit_edge49.us_crit_edge:      ; preds = %.prol.loopexit72
  br label %._crit_edge49.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit72
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv66 = phi i64 [ %indvars.iv.next67.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv66.unr.ph, %.preheader.us.new.preheader ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83, i64 %indvars.iv66
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv77
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = load double, double* %8, align 8
  %21 = fsub double %20, %19
  store double %21, double* %8, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83, i64 %indvars.iv.next67
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next67, i64 %indvars.iv77
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = load double, double* %8, align 8
  %28 = fsub double %27, %26
  store double %28, double* %8, align 8
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  %exitcond70.1 = icmp eq i64 %indvars.iv.next67.1, %indvars.iv83
  br i1 %exitcond70.1, label %._crit_edge49.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge49.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge49.us

._crit_edge49.us:                                 ; preds = %.prol.loopexit72.._crit_edge49.us_crit_edge, %._crit_edge49.us.loopexit
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next78, 2000
  br i1 %exitcond80, label %._crit_edge51.loopexit, label %._crit_edge49.us..preheader.us_crit_edge

._crit_edge49.us..preheader.us_crit_edge:         ; preds = %._crit_edge49.us
  br label %.preheader.us

.preheader42:                                     ; preds = %._crit_edge..preheader42_crit_edge, %.preheader44..preheader42_crit_edge
  %indvars.iv60 = phi i64 [ 0, %.preheader44..preheader42_crit_edge ], [ %indvars.iv.next61, %._crit_edge..preheader42_crit_edge ]
  %29 = add nuw i64 %indvars.iv60, 4294967295
  %30 = icmp sgt i64 %indvars.iv60, 0
  br i1 %30, label %.lr.ph, label %.preheader42.._crit_edge_crit_edge

.preheader42.._crit_edge_crit_edge:               ; preds = %.preheader42
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader42
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83, i64 %indvars.iv60
  %xtraiter88 = and i64 %indvars.iv60, 1
  %lcmp.mod = icmp eq i64 %xtraiter88, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %32 = load double, double* %3, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv60
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = load double, double* %31, align 8
  %37 = fsub double %36, %35
  store double %37, double* %31, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %38 = trunc i64 %29 to i32
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv60
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = load double, double* %31, align 8
  %46 = fsub double %45, %44
  store double %46, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv60
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = load double, double* %31, align 8
  %53 = fsub double %52, %51
  store double %53, double* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv60
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %.preheader42.._crit_edge_crit_edge, %._crit_edge.loopexit
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv60, i64 %indvars.iv60
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83, i64 %indvars.iv60
  %57 = load double, double* %56, align 8
  %58 = fdiv double %57, %55
  store double %58, double* %56, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond = icmp eq i64 %indvars.iv.next61, %indvars.iv83
  br i1 %exitcond, label %.preheader.lr.ph, label %._crit_edge..preheader42_crit_edge

._crit_edge..preheader42_crit_edge:               ; preds = %._crit_edge
  br label %.preheader42

._crit_edge51.loopexit:                           ; preds = %._crit_edge49.us
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %.preheader.lr.ph.._crit_edge51_crit_edge, %.preheader44.._crit_edge51_crit_edge, %._crit_edge51.loopexit
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next84, 2000
  br i1 %exitcond86, label %._crit_edge54, label %._crit_edge51..preheader44_crit_edge

._crit_edge51..preheader44_crit_edge:             ; preds = %._crit_edge51
  br label %.preheader44

._crit_edge54:                                    ; preds = %._crit_edge51
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
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us..preheader.us_crit_edge ]
  %5 = mul nsw i64 %indvars.iv16, 2000
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge.._crit_edge20_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge20_crit_edge ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge20.._crit_edge_crit_edge

._crit_edge20.._crit_edge_crit_edge:              ; preds = %._crit_edge20
  br label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge20
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge20.._crit_edge_crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge20_crit_edge

._crit_edge.._crit_edge20_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge20

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond19, label %._crit_edge15, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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

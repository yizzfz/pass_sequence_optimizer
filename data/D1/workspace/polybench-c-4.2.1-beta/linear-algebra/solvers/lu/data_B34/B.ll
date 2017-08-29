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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]*) unnamed_addr #0 {
.preheader74.lr.ph:
  br label %.lr.ph96

.lr.ph96:                                         ; preds = %.lr.ph96.backedge, %.preheader74.lr.ph
  %indvars.iv150 = phi i64 [ 0, %.preheader74.lr.ph ], [ %3, %.lr.ph96.backedge ]
  %indvars.iv148 = phi i64 [ 1, %.preheader74.lr.ph ], [ %indvars.iv148.be, %.lr.ph96.backedge ]
  %1 = sub i64 1998, %indvars.iv150
  %2 = shl i64 %1, 3
  br label %9

.preheader73:                                     ; preds = %9
  %3 = add nuw nsw i64 %indvars.iv150, 1
  %4 = icmp slt i64 %3, 2000
  br i1 %4, label %._crit_edge98.thread, label %._crit_edge98

._crit_edge98.thread:                             ; preds = %.preheader73
  %5 = and i64 %2, 34359738360
  %6 = add nuw nsw i64 %5, 8
  %scevgep145 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %3
  %7 = mul nuw nsw i64 %indvars.iv150, 2000
  %scevgep146 = getelementptr double, double* %scevgep145, i64 %7
  %scevgep146147 = bitcast double* %scevgep146 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep146147, i8 0, i64 %6, i32 8, i1 false)
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv150, i64 %indvars.iv150
  store double 1.000000e+00, double* %8, align 8
  br label %.lr.ph96.backedge

; <label>:9:                                      ; preds = %9, %.lr.ph96
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %9 ], [ 0, %.lr.ph96 ]
  %10 = sub nsw i64 0, %indvars.iv133
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv150, i64 %indvars.iv133
  store double %15, double* %16, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next134, %indvars.iv148
  br i1 %exitcond138, label %.preheader73, label %9

._crit_edge98:                                    ; preds = %.preheader73
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv150, i64 %indvars.iv150
  store double 1.000000e+00, double* %17, align 8
  %exitcond153 = icmp eq i64 %3, 2000
  br i1 %exitcond153, label %.preheader72.us.preheader.new, label %.lr.ph96.backedge

.lr.ph96.backedge:                                ; preds = %._crit_edge98, %._crit_edge98.thread
  %indvars.iv148.be = add nuw nsw i64 %indvars.iv148, 1
  br label %.lr.ph96

.preheader72.us.preheader.new:                    ; preds = %._crit_edge98
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge93.us.3

.preheader69.us.us.preheader:                     ; preds = %.preheader69.us.us.preheader.preheader, %._crit_edge82.us
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %._crit_edge82.us ], [ 0, %.preheader69.us.us.preheader.preheader ]
  br label %.preheader69.us.us.new

._crit_edge82.us:                                 ; preds = %._crit_edge80.us.us
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond121 = icmp eq i64 %indvars.iv.next119, 2000
  br i1 %exitcond121, label %.preheader.us.new.preheader, label %.preheader69.us.us.preheader

.preheader.us.new.preheader:                      ; preds = %._crit_edge82.us
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader.us.new

.preheader69.us.us.new:                           ; preds = %._crit_edge80.us.us, %.preheader69.us.us.preheader
  %indvars.iv114 = phi i64 [ 0, %.preheader69.us.us.preheader ], [ %indvars.iv.next115, %._crit_edge80.us.us ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv114, i64 %indvars.iv118
  br label %21

._crit_edge80.us.us:                              ; preds = %21
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next115, 2000
  br i1 %exitcond117, label %._crit_edge82.us, label %.preheader69.us.us.new

; <label>:21:                                     ; preds = %21, %.preheader69.us.us.new
  %indvars.iv106 = phi i64 [ 0, %.preheader69.us.us.new ], [ %indvars.iv.next107.1, %21 ]
  %22 = load double, double* %20, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv118
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv114, i64 %indvars.iv106
  %27 = load double, double* %26, align 8
  %28 = fadd double %27, %25
  store double %28, double* %26, align 8
  %indvars.iv.next107 = or i64 %indvars.iv106, 1
  %29 = load double, double* %20, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next107, i64 %indvars.iv118
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv114, i64 %indvars.iv.next107
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next107.1 = add nuw nsw i64 %indvars.iv106, 2
  %exitcond109.1 = icmp eq i64 %indvars.iv.next107.1, 2000
  br i1 %exitcond109.1, label %._crit_edge80.us.us, label %21

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %._crit_edge.us
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge.us ], [ 0, %.preheader.us.new.preheader ]
  br label %36

; <label>:36:                                     ; preds = %36, %.preheader.us.new
  %indvars.iv = phi i64 [ 0, %.preheader.us.new ], [ %indvars.iv.next.3, %36 ]
  %37 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv103, i64 %indvars.iv
  %38 = bitcast double* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv
  %41 = bitcast double* %40 to i64*
  store i64 %39, i64* %41, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %42 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next
  %43 = bitcast double* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv.next
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %47 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.1
  %48 = bitcast double* %47 to i64*
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv.next.1
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.2
  %53 = bitcast double* %52 to i64*
  %54 = load i64, i64* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv.next.2
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us, label %36

._crit_edge.us:                                   ; preds = %36
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond = icmp eq i64 %indvars.iv.next104, 2000
  br i1 %exitcond, label %._crit_edge77, label %.preheader.us.new

._crit_edge77:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %18) #4
  ret void

._crit_edge93.us.3:                               ; preds = %._crit_edge93.us.3, %.preheader72.us.preheader.new
  %indvars.iv126 = phi i64 [ 0, %.preheader72.us.preheader.new ], [ %indvars.iv.next127.3.1, %._crit_edge93.us.3 ]
  %57 = mul nuw nsw i64 %indvars.iv126, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127 = or i64 %indvars.iv126, 1
  %58 = mul nuw nsw i64 %indvars.iv.next127, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %58
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.1 = or i64 %indvars.iv126, 2
  %59 = mul nuw nsw i64 %indvars.iv.next127.1, 16000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.2 = or i64 %indvars.iv126, 3
  %60 = mul nuw nsw i64 %indvars.iv.next127.2, 16000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %60
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.3 = or i64 %indvars.iv126, 4
  %61 = mul nuw nsw i64 %indvars.iv.next127.3, 16000
  %scevgep.13 = getelementptr i8, i8* %18, i64 %61
  call void @llvm.memset.p0i8.i64(i8* %scevgep.13, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.14 = or i64 %indvars.iv126, 5
  %62 = mul nuw nsw i64 %indvars.iv.next127.14, 16000
  %scevgep.1.1 = getelementptr i8, i8* %18, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.1.1 = or i64 %indvars.iv126, 6
  %63 = mul nuw nsw i64 %indvars.iv.next127.1.1, 16000
  %scevgep.2.1 = getelementptr i8, i8* %18, i64 %63
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.2.1 = or i64 %indvars.iv126, 7
  %64 = mul nuw nsw i64 %indvars.iv.next127.2.1, 16000
  %scevgep.3.1 = getelementptr i8, i8* %18, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.3.1 = add nsw i64 %indvars.iv126, 8
  %exitcond129.3.1 = icmp eq i64 %indvars.iv.next127.3.1, 2000
  br i1 %exitcond129.3.1, label %.preheader69.us.us.preheader.preheader, label %._crit_edge93.us.3

.preheader69.us.us.preheader.preheader:           ; preds = %._crit_edge93.us.3
  %65 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader69.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]*) unnamed_addr #2 {
.preheader44.preheader:
  br label %.preheader44

.preheader44:                                     ; preds = %._crit_edge51, %.preheader44.preheader
  %indvars.iv89 = phi i64 [ 0, %.preheader44.preheader ], [ %indvars.iv.next90, %._crit_edge51 ]
  %1 = add nuw nsw i64 %indvars.iv89, 4294967295
  %2 = icmp sgt i64 %indvars.iv89, 0
  br i1 %2, label %.preheader42.preheader, label %._crit_edge51

.preheader42.preheader:                           ; preds = %.preheader44
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 0
  br label %.preheader42

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter7893 = and i64 %indvars.iv89, 1
  %4 = trunc i64 %1 to i32
  %5 = icmp eq i64 %xtraiter7893, 0
  %6 = icmp eq i32 %4, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge49.us
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %._crit_edge49.us ], [ %indvars.iv89, %.preheader.us.preheader ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv83
  %.pre59 = load double, double* %7, align 8
  br i1 %5, label %.prol.loopexit77, label %8

; <label>:8:                                      ; preds = %.preheader.us
  %9 = load double, double* %3, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv83
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fsub double %.pre59, %12
  store double %13, double* %7, align 8
  br label %.prol.loopexit77

.prol.loopexit77:                                 ; preds = %.preheader.us, %8
  %indvars.iv71.unr.ph = phi i64 [ 1, %8 ], [ 0, %.preheader.us ]
  %.unr80.ph = phi double [ %13, %8 ], [ %.pre59, %.preheader.us ]
  br i1 %6, label %._crit_edge49.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit77
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv71 = phi i64 [ %indvars.iv.next72.1, %.preheader.us.new ], [ %indvars.iv71.unr.ph, %.preheader.us.new.preheader ]
  %14 = phi double [ %26, %.preheader.us.new ], [ %.unr80.ph, %.preheader.us.new.preheader ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv71
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv71, i64 %indvars.iv83
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %14, %19
  store double %20, double* %7, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv.next72
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next72, i64 %indvars.iv83
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %7, align 8
  %indvars.iv.next72.1 = add nuw nsw i64 %indvars.iv71, 2
  %exitcond75.1 = icmp eq i64 %indvars.iv.next72.1, %indvars.iv89
  br i1 %exitcond75.1, label %._crit_edge49.us.loopexit, label %.preheader.us.new

._crit_edge49.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge49.us

._crit_edge49.us:                                 ; preds = %._crit_edge49.us.loopexit, %.prol.loopexit77
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next84, 2000
  br i1 %exitcond86, label %._crit_edge51.loopexit, label %.preheader.us

.preheader42:                                     ; preds = %.preheader42.preheader, %._crit_edge
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge ], [ 0, %.preheader42.preheader ]
  %27 = add nuw nsw i64 %indvars.iv65, 4294967295
  %28 = icmp sgt i64 %indvars.iv65, 0
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv65
  %.pre = load double, double* %29, align 8
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader42
  %xtraiter94 = and i64 %indvars.iv65, 1
  %lcmp.mod = icmp eq i64 %xtraiter94, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %30

; <label>:30:                                     ; preds = %.lr.ph
  %31 = load double, double* %3, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv65
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %.pre, %34
  store double %35, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %30
  %indvars.iv.unr.ph = phi i64 [ 1, %30 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %35, %30 ], [ %.pre, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %35, %30 ], [ undef, %.lr.ph ]
  %36 = trunc i64 %27 to i32
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %38 = phi double [ %50, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv65
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  store double %44, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv.next
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv65
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %44, %49
  store double %50, double* %29, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv65
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader42, %.prol.loopexit
  %51 = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %.pre, %.preheader42 ], [ %50, %._crit_edge.loopexit ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv65
  %53 = load double, double* %52, align 8
  %54 = fdiv double %51, %53
  store double %54, double* %29, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond = icmp eq i64 %indvars.iv.next66, %indvars.iv89
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader42

._crit_edge51.loopexit:                           ; preds = %._crit_edge49.us
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %.preheader44
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, 2000
  br i1 %exitcond92, label %._crit_edge55, label %.preheader44

._crit_edge55:                                    ; preds = %._crit_edge51
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv15, 2000
  br label %6

; <label>:6:                                      ; preds = %13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %13 ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %11, %6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond18, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
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
